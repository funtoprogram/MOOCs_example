class Soil {
	int col, row;
	int health;

	void display(){

		if(health > 0){

			int soilColor = (int) (row / 4);
			int soilAlpha = (int) (min(5, ceil((float)health / (15 / 5))) - 1);

			image(soilImages[soilColor][soilAlpha], col * SOIL_SIZE, row * SOIL_SIZE);

			if(health > 15){
				int stoneSize = (int) (min(5, ceil(((float)health - 15) / (15 / 5))) - 1);
				image(stoneImages[0][stoneSize], col * SOIL_SIZE, row * SOIL_SIZE);
			}

			if(health > 15 * 2){
				int stoneSize = (int) (min(5, ceil(((float)health - 15 * 2) / (15 / 5))) - 1);
				image(stoneImages[1][stoneSize], col * SOIL_SIZE, row * SOIL_SIZE);
			}

		}else{
			image(soilEmpty, col * SOIL_SIZE, row * SOIL_SIZE);
		}
	}

	Soil(int col, int row, int health){
		this.health = health;
		this.col = col;
		this.row = row;
	}

}
