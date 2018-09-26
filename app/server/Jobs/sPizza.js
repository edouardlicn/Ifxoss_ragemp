const misc = require('../sMisc');
const i18n = require('../sI18n');
const Job = require('./sJob');
const Vehicle = require('../Basic/Vehicles/sVehicle');


class Pizza extends Job {
    constructor() {
        const d = { name: "Pizza Lieferdienst", x: 132.018, y: -1461.832, z: 29.357, rot: 65.55, dim: 0 }
        super(d);
        this.getOrderCoordP = { x: 144.364, y: -1462.013, z: 29.142, rot: 137.99 };
        this.pizzaPoint = [
            {x: -701.471, y: -883.006, z: 23.785 },
            {x: -51.156, y: -1059.21, z: 27.782 },
            {x: -154.511, y: -1348.468, z: 29.92 },
            {x: 403.278, y: -1753.274, z: 29.343 },
            {x: 498.963, y: -1700.308, z: 29.401 },
            {x: 320.692, y: -1987.697, z: 22.691 },
            {x: -53.648, y: -1786.849, z: 27.843 },
            {x: 129.254, y: -1576.137, z: 29.301 },
            {x: 57.625, y: -1028.525, z: 29.472 },
            {x: 284.303, y: -937.579, z: 29.336 },
            {x: 414.69, y: -943.435, z: 29.404 },
            {x: 805.598, y: -1076.982, z: 28.613 },


        ];
        this.pizzaPointList = [];

        mp.events.add({
            "playerEnterColshape" : (player, shape) => {
                if (player.vehicle || !player.loggedIn || !this.isPlayerWorksHere(player)) return;
                if (shape === this.getOrderColshapeP) this.playerEntersGetOrderShape(player);
                else if (typeof player.job.currentOrder === "number" && shape === this.pizzaPointList[player.job.currentOrder].colshape) {
                   this.successDeliver(player);
                }
            },
        
            "playerExitColshape" : (player, shape) => {
                if (!player.loggedIn) return;
                if (shape === this.getOrderColshapeP) this.playerExitsGetOrderShape(player);
            },
        
            "sKeys-E" : (player) => {
                if (!player.loggedIn || !player.job.canGetNewOrder) return;
                this.playerPressedKeyOnNewOrderShape(player);
            },
        
            "playerQuit" : (player, exitType, reason) => {
                if (!player.loggedIn) return;
                if (this.isPlayerWorksHere(player)) this.finishWork(player);
            },
        
        });

        this.createPEntities();
    }

    setLocalSettings() {
        this.blip.model = 488;
        this.blip.color = 44;
    }

    createPEntities() {
        this.getOrderColshapeP = mp.colshapes.newSphere(this.getOrderCoordP.x, this.getOrderCoordP.y, this.getOrderCoordP.z, 0.5);

        this.getOrderMarkerP = mp.markers.new(1, new mp.Vector3(this.getOrderCoordP.x, this.getOrderCoordP.y, this.getOrderCoordP.z - 1), 0.75,
        {
            color: [255, 165, 0, 255],
            visible: false,
        });

        for (const pos of this.pizzaPoint) {
            const marker = mp.markers.new(1, new mp.Vector3(pos.x, pos.y, pos.z - 1), 0.75, {
                color: [255, 165, 0, 25],
                visible: false,
            });
            const colshape = mp.colshapes.newSphere(pos.x, pos.y, pos.z, 1);
            const blip = mp.blips.new(1, new mp.Vector3(pos.x, pos.y, pos.z), {	
                shortRange: true,
                scale: 0,
                color: 60,
            });
            const obj = { blip, marker, colshape }
            this.pizzaPointList.push(obj);
        }

    }

    enteredMainShape(player) {
        if (this.isPlayerWorksHere(player)) {
            player.notify(`${i18n.get('sCBDeliveryMen', 'uninvite', player.lang)}!`);
            if (typeof player.job.currentOrder === "number") player.outputChatBox(`!{225, 0, 0}${i18n.get('sCBDeliveryMen', 'haveUndeliveredOrder', player.lang)}!`);
        }
        else player.notify(`${i18n.get('sCBDeliveryMen', 'invite', player.lang)}!`);
    }

    pressedKeyOnMainShape(player) {
        if (this.isPlayerWorksHere(player)) this.finishWork(player);
        else if (this.isPlayerWorksOnOtherJob(player)) player.notify(`~r~${i18n.get('basic', 'workingOnOtherJob', player.lang)}!`);
        else this.startWork(player);
    }

    finishWork(player) {
        if (typeof player.job.currentOrder === "number") {
            player.newFine(500, `Bus Driver - ${i18n.get('sCBDeliveryMen', 'undelivered', player.lang)}`);
            player.removeLoyality(10);
        }
        this.cancelCurrentOrder(player);
        super.finishWork(player);
    }

    startWork(player) {
        if (player.loyality < 5) return player.notify(`~r~${i18n.get('basic', 'needMoreLoyality1', player.lang)} 5 ${i18n.get('basic', 'needMoreLoyality2', player.lang)}!`);
        super.startWork(player);
        player.job = { name: this.name, currentOrder: false, canGetNewOrder: false };
        this.getOrderMarkerP.showFor(player);
        const d = {
            model: 'faggio2',
            coord: this.vehjobspawn(player),
//          coord:(421.506, -640.138, 28.152),
            id: 0,
            title: 'Pegassi Faggio',
            fuel: 10,
            fuelTank: 10,
            fuelRate: 2,
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
        misc.log.debug(`${player.name} spawned faggio2`);
        player.notify(`${i18n.get('sVehicle', 'helpUnlock', player.lang)}`);
        player.notify(`${i18n.get('sVehicle', 'helpEngine', player.lang)}`);
    }

	generateRandomNumberPlate() {
		const possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		let number = '';
		for (let i = 0; i < 8; i++) {
			number += possible.charAt(misc.getRandomInt(0, possible.length));
		}
		return number;
    }
    
	vehjobspawn(player) {
		const obj = { 
			x: 146.975, 
			y: -1460.249, 
			z: 28.791, 
			rot: 51.76, 
			dim: player.dimension, 
		}
		if (player.vehicle) obj.rot = player.vehicle.rotation.z;
		return JSON.stringify(obj);
	}

    playerEntersGetOrderShape(player) {
        if (!this.isPlayerWorksHere(player)) return;
        if (typeof player.job.currentOrder === "number") return player.notify(`~r~${i18n.get('sCBDeliveryMen', 'cantGetNewOrder', player.lang)}!`);
        player.job.canGetNewOrder = true;
        player.notify(`${i18n.get('sCBDeliveryMen', 'getNewOrder', player.lang)}!`);
    }

    playerPressedKeyOnNewOrderShape(player) {
        player.notify(`~g~${i18n.get('sCBDeliveryMen', 'deliver', player.lang)}!`);
        this.generateNewOrder(player);
    }

    generateNewOrder(player) {
        const i = misc.getRandomInt(0, this.pizzaPointList.length - 1)
        if (i === player.job.currentOrder) return this.generateNewOrder(player);
        this.cancelCurrentOrder(player);
        this.pizzaPointList[i].marker.showFor(player);
        this.pizzaPointList[i].blip.routeFor(player, 60, 0.7);
        player.job.currentOrder = i
        return i;
    }

    cancelCurrentOrder(player) {
        if (typeof player.job.currentOrder !== "number") return;
        const i = player.job.currentOrder;
        this.pizzaPointList[i].marker.hideFor(player);
        this.pizzaPointList[i].blip.unrouteFor(player);
        player.job.currentOrder = false;
    }

    playerExitsGetOrderShape(player) {
        player.job.canGetNewOrder = false;
    }

    successDeliver(player) {
        const prize = misc.getRandomInt(5, 20);
        const earnedMoney = 20 + prize;
        player.changeMoney(earnedMoney);
        player.notify(`${i18n.get('basic', 'earned1', player.lang)} ~g~$${earnedMoney}! ~w~${i18n.get('basic', 'earned2', player.lang)}!`);
        if (player.loyality < 150) player.addLoyality(1);
        this.cancelCurrentOrder(player);
        misc.log.debug(`${player.name} earned $${earnedMoney}`);
    }
    
}
new Pizza();