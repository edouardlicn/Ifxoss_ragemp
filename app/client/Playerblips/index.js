//On client side it only show other player's blips in minimap.For long range it have to move to server side.


const Natives = {
    SET_BLIP_CATEGORY: "0x1b43a8c070cad58c",
    SHOW_HEADING_INDICATOR_ON_BLIP: "0x7fb3ef6fd3b188b7"
};

mp.events.add({
    "entityStreamIn": (entity) => {
        if (entity.type == "player") {
            let color = parseInt(entity.getVariable("blipColor"));
            if (entity.blip == 0) entity.createBlip(1);

            entity.setBlipColor(isNaN(color) ? 0 : color);
            mp.game.invoke(Natives.SET_BLIP_CATEGORY, entity.blip, 7);
            mp.game.invoke(Natives.SHOW_HEADING_INDICATOR_ON_BLIP, entity.blip, true);
        }
    },

    "entityDataChange": (entity, key, value) => {
        if (entity.type == "player" && key == "blipColor") {
            let color = parseInt(entity.getVariable("blipColor"));
            entity.setBlipColor(isNaN(color) ? 0 : color);
        }
    }
});