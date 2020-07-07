class Battery extends Item {

	void display(){

		if(!alive) return;

		image(battery, x, y);

	}

	void checkCollision(Player player){

		if(!alive) return;

		if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
			addTime(CLOCK_BONUS_SECONDS);
			alive = false;
		}

	}

	Battery(float x, float y){
		super(x, y);
	}
}
