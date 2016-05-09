package beans;

public class Box {
	private double length, width, height;
	
	public Box(){
		length = width = height = 0;
	}
	
	public double getCV(){
		return length*width*height;
	}

	public double getLength() {
		return length;
	}

	public void setLength(double length) {
		this.length = length;
	}

	public double getWidth() {
		return width;
	}

	public void setWidth(double width) {
		this.width = width;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}
}
