class Laser {
	boolean alive;
	float x, y;
	float originX, originY;
	float angle;
	static final float maxLength = 20f;
	float speed = 4f;

	void update(){

		if(!alive) return;

		x += cos(angle) * speed;
		y += sin(angle) * speed;
	}

	void display(){

		if(!alive) return;

		strokeWeight(10);
		stroke(#FFC900);
		if(dist(x, y, originX, originY) <= maxLength){
			line(x, y, originX, originY);
		}else{
			line(x, y, x - cos(angle) * maxLength, y - sin(angle) * maxLength);
		}
	}

	void checkCollision(Player player){
		if(!alive) return;

		if(isHit(x, y, 0, 0, player.x, player.y, player.w, player.h)){
			player.hurt();
			alive = false;
		}
	}

	void fire(float x, float y, float destX, float destY){
		this.x = originX = x;
		this.y = originY = y;
		angle = atan2(destY - y, destX - x);
		alive = true;
	}

	Laser(){
		alive = false;
	}
}
