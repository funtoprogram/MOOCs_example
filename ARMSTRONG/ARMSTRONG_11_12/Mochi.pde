class Mochi extends Enemy{

	boolean isForward = true;
	float speed = 2f;
	Laser laser;
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
	int laserTimer;

	void display(){
		if(isForward){
			image(mochi, x, y);
		}else{
			pushMatrix();
			translate(x + SOIL_SIZE, y);
			scale(-1, 1);
			image(mochi, 0, 0);
			popMatrix();
		}

		laser.display();
	}

	void update(){

		int row = round(y / SOIL_SIZE);
		boolean isPlayerYInRange = row + PLAYER_DETECT_RANGE_ROW >= player.row
								&& row - PLAYER_DETECT_RANGE_ROW <= player.row;
		boolean isPlayerXInRange = (isForward && player.x + SOIL_SIZE / 2 > x + HAND_OFFSET_X_FORWARD) || (!isForward && player.x + SOIL_SIZE / 2 < x + HAND_OFFSET_X_BACKWARD);
		if(isPlayerXInRange && isPlayerYInRange){

			if(laserTimer <= 0){
				float handX = x + ((isForward) ? HAND_OFFSET_X_FORWARD : HAND_OFFSET_X_BACKWARD);
				float handY = y + HAND_OFFSET_Y;
				laser.fire(handX, handY, player.x + SOIL_SIZE / 2, player.y + SOIL_SIZE / 2);
				laserTimer = LASER_COOLDOWN;
			}

		}else{

			if(x >= width - w){
				isForward = false;
			}else if(x <= 0){
				isForward = true;
			}

			x += (isForward) ? speed : -speed;

		}

		laser.update();
		laserTimer--;

	}

	void checkCollision(Player player){

		super.checkCollision(player);
		laser.checkCollision(player);

	}

	Mochi(float x, float y){
		super(x, y);
		laser = new Laser();
	}
}
