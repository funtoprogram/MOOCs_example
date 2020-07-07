class Box extends Item {

	void display(){

		if(!alive) return;

		image(box, x, y);

	}

	void checkCollision(Player player){

		if(!alive) return;

		if(player.health < player.PLAYER_MAX_HEALTH
		&& isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
			player.health ++;
			alive = false;
		}

	}

	Box(float x, float y){
		super(x, y);
	}
}
