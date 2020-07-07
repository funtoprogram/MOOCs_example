class Frog extends Enemy{

	boolean isForward = true;
	float speed = 1f;
	float speedTriggered = 5f;

	void display(){
		if(isForward){
			image(frog, x, y);
		}else{
			pushMatrix();
			translate(x + SOIL_SIZE, y);
			scale(-1, 1);
			image(frog, 0, 0);
			popMatrix();
		}
	}

	void update(){
		float currentSpeed = (round(y / SOIL_SIZE) == player.row
					&& ((isForward && player.x > x + w) || (!isForward && player.x < x)))
					? speedTriggered : speed;
		if(x >= width - w){
			isForward = false;
		}else if(x <= 0){
			isForward = true;
		}
		if(!isForward) currentSpeed *= -1;
		x += currentSpeed;
	}

	Frog(float x, float y){
		super(x, y);
	}
}
