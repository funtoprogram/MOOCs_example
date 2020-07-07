class Taco extends Enemy{

	float speed = 2f;

	void display(){
		image(taco, x, y);
	}

	void update(){
		x += speed;
		if(x >= width) x = -w;
	}

	Taco(float x, float y){
		super(x, y);
	}
}
