const misc = require('../sMisc');
const i18n = require('../sI18n');
const moneySingleton = require('./Money/sMoney');
const characterSingleton = require('../Character/sCharacterCreator');
const clothesSingleton = require('../Character/sClothes');
const headOverlaySingleton = require('../Character/sHeadOverlay');
const vehiclesSingleton = require('../Basic/Vehicles/sVehicleSingletone');
const faction = require('../Factions/sFaction');
const hospital = require('../Factions/Hospital/sHospital');
const prison = require('../Factions/Police/Prison/sPrison');


class PlayerSingleton {

    async createNewUser(player, email, firstName, lastName, pass, lang) {
        const firstSpawn = { 
            x: -471.75, 
            y: -362.102, 
            z: 34, 
            rot: 192.63, 
            dim: 0, 
        }
        await misc.query(`INSERT INTO users 
        (email, firstName, lastName, password, ip, regdate, position, lang, socialclub) VALUES 
        ('${email}', '${firstName}', '${lastName}', '${pass}', '${player.ip}', '${new Date().toLocaleString()}', '${JSON.stringify(firstSpawn)}', '${player.lang}', '${player.socialClub}')`);

        misc.log.debug(`New Account: ${email} | ${firstName} ${lastName}`);
    }

    async loadAccount(player, id) {
        const d = await misc.query(`SELECT * FROM users WHERE id = '${id}' LIMIT 1`);
        player.loggedIn = true;
        player.guid = d[0].id;
        player.email = d[0].email;
        player.firstName = d[0].firstName;
        player.lastName = d[0].lastName;
        player.adminlvl = d[0].adminlvl;
        player.lang = d[0].lang;
        player.loyality = d[0].loyality;
        player.updateName();
        player.tp(JSON.parse(d[0].position));
        player.health = d[0].health;
        player.call("cCloseCefAndDestroyCam");


        const q1 = moneySingleton.loadUser(player);
        const q2 = characterSingleton.loadPlayerBody(player);
        const q3 = clothesSingleton.loadPlayerClothes(player);
        const q4 = headOverlaySingleton.loadUser(player);
        const q5 = vehiclesSingleton.loadPlayerVehicles(player.guid);
        const q6 = faction.loadUser(player);
        const q7 = hospital.loadUser(player);
        const q8 = prison.loadUser(player);
        await Promise.all([q1, q2, q3, q4, q5, q6, q7, q8]);

        misc.log.debug(`${player.name} logged in`);
    }

    saveAccount(player) {
        player.saveBasicData();
        vehiclesSingleton.savePlayerVehicles(player.guid);
        prison.savePlayerAccount(player);
        misc.log.debug(`${player.name} disconnected`);
        player.loggedIn = false;
    }

    loadPlayerTemplate(player) {
        player.loggedIn = false;
        player.lang = 'eng';
        player.guid = false;
        player.email = false;
        player.firstName = false;
        player.lastName = false;
        player.loyality = 0;
        player.adminlvl = 0;
        player.faction = {};
        player.canOpen = {};
        player.canEnter = {};
        player.job = {};


        player.updateName = function() {
            this.name = `${this.firstName} ${this.lastName}`;
        }
        player.tp = function(d) {
            this.position = new mp.Vector3(d.x, d.y, d.z);
            this.heading = d.rot;
            this.dimension = 0;
            if (d.dim) this.dimension = d.dim;
        }

        player.tpWithVehicle = function(d) {
            if (!this.isDriver() || !this.vehicle) return;
            this.vehicle.position = new mp.Vector3(d);
            this.heading = d.rot;
            this.vehicle.dimension = d.dim;
        }

        player.getCurrentPos = function(changeHeight = 0) {
            const obj = {
                x: misc.roundNum(this.position.x, 1),
                y: misc.roundNum(this.position.y, 1),
                z: misc.roundNum(this.position.z + changeHeight, 1),
                rot: misc.roundNum(this.heading, 1),
                dim: this.dimension,
            }
            return obj;
        }

        player.addLoyality = function(value) {
            value = misc.roundNum(value);
			if (value === 0) return;
            this.loyality += value;
            this.showLoyalityNotification(value);
        }

        player.removeLoyality = function(value) {
            value = misc.roundNum(value);
            this.loyality -= value;
            if (this.loyality < 0) this.loyality = 0;
            this.showLoyalityNotification(-value);
        }

        player.showLoyalityNotification = function(value) {
            let plus = "";
            if (value > 0) plus = "+";
            this.notify(`${i18n.get('sLoyality', 'loyality', this.lang)} ~b~${plus}${value}`);
        }

        player.saveBasicData = function() {
            const pos = this.getCurrentPos(0.1);
            misc.query(`UPDATE users SET ip = '${this.ip}', logdate = '${new Date().toLocaleString()}', position = '${JSON.stringify(pos)}', health = '${this.health}', loyality = '${this.loyality}' WHERE id = '${this.guid}'`);
        }

        player.isDriver = function() {
            if (!this.vehicle || this.seat !== -1) return false;
            return true;
        }
        
    }

}
const playerSingleton = new PlayerSingleton();
module.exports = playerSingleton;

//normal users command.

mp.events.addCommand({

    'save' : (player) => {
        if (!player.loggedIn) return;
        playerSingleton.saveAccount(player);
        player.outputChatBox(`${i18n.get('sPlayer', 'saveGame', player.lang)}`);
    },
    
    'pos' : (player) => { 
        if (!player.loggedIn) return;
        const pos = player.position;
        let rot;
        if (player.vehicle) rot = player.vehicle.rotation.z
        else rot = player.heading;
        const str = `x: ${misc.roundNum(pos.x, 3)}, y: ${misc.roundNum(pos.y, 3)}, z: ${misc.roundNum(pos.z, 3)}, rot: ${misc.roundNum(rot, 2)}`;
        player.outputChatBox(str);
        misc.log.debug(str);
    }, 
    
    'veh' : (player) => {  // Temporary vehicle spawning
				if (player.health < 5) return;
				const d = {
					model: 'faggio2',
					coord: misc.getPlayerCoordJSON(player),
					id: 0,
					title: 'Pegassi Faggio',
					fuel: 1,
					fuelTank: 5,
					fuelRate: 2,
					price: 1,
					ownerId: 0,
					whoCanOpen: JSON.stringify([player.guid]),
					factionName: '',
					numberPlate: this.generateRandomNumberPlate(),
					primaryColor: JSON.stringify([ misc.getRandomInt(0, 159), misc.getRandomInt(0, 159), misc.getRandomInt(0, 159) ]),
					secondaryColor: JSON.stringify([ misc.getRandomInt(0, 159), misc.getRandomInt(0, 159), misc.getRandomInt(0, 159) ]),
				}
				new Vehicle(d);
				misc.log.debug(`${player.name} spawned faggio2`);
				player.notify(`${i18n.get('sVehicle', 'helpUnlock', player.lang)}`);
				player.notify(`${i18n.get('sVehicle', 'helpEngine', player.lang)}`);		
		},    
    
}); 




//Admin command.

mp.events.addCommand({
  

    'tp' : (player, _, x, y, z) => { 
         if (player.adminlvl < 1) return;
         x = parseFloat(x);
         y = parseFloat(y);
         z = parseFloat(z);
         if (isNaN(x) || isNaN(y) || isNaN(z)) {
            player.outputChatBox(`${i18n.get('sPlayer', 'tpHelp', player.lang)}`);
            return;
         } 
         player.position = new mp.Vector3(x, y, z);
         player.outputChatBox(`${i18n.get('sPlayer', 'tpOK', player.lang)}`);       
        
    },  
    
    
    'printm' : (player, _, targetID, amount) => {
         if (player.adminlvl < 1) return;
         targetID = Number(targetID);
         amount = Number(amount);
         let playert = mp.players.at(targetID); //https://wiki.rage.mp/index.php?title=Pool::at
         console.log(`${playert.name}`);
         
    }, 
    
    'v' : (player, fullText, model) => {
				if (player.adminLvl < 1) return;
				if (!model) return player.notify("Model required");
				const d = {
					model,
					coord: misc.getPlayerCoordJSON(player),
					id: 0,
					title: model,
					fuel: 50,
					fuelTank: 60,
					fuelRate: 10,
					price: 1,
					ownerId: 0,
					whoCanOpen: JSON.stringify([player.guid]),
					factionName: '',
					numberPlate: this.generateRandomNumberPlate(),
					primaryColor: JSON.stringify([ misc.getRandomInt(0, 159), misc.getRandomInt(0, 159), misc.getRandomInt(0, 159) ]),
					secondaryColor: JSON.stringify([ misc.getRandomInt(0, 159), misc.getRandomInt(0, 159), misc.getRandomInt(0, 159) ]),
				}
				const vehicle = new Vehicle(d);
				player.putIntoVehicle(vehicle, -1);
				misc.log.debug(`${player.name} spawned ${model}`);
		},

    
});   