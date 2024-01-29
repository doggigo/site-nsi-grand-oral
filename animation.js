import { LaTeXVector } from "./main.js";

export class Vec2D {
	constructor(x, y, round) {
		this.x = round? Math.floor(x) : x;
		this.y = round? Math.floor(y) : y;
	}
  toString() {
    return `( ${this.x} ; ${this.y} )`;
  }
  toLaTeX() {
    return LaTeXVector(this.x,this.y);
  }
}

function circleAnimation(p) {

  p.normalized = null;

  p.displayNormalized = () => {
    p.stroke(255,0,0);
    p.beginShape();
    p.vertex(p.centerCoords.x,p.centerCoords.y);
    p.vertex(p.centerCoords.x - p.normalized.x * 50,p.centerCoords.y - p.normalized.y * 50);
    p.endShape();
    p.stroke(0,0,0);
  }

  p.mouseInFrame = () => !(p.mouseX < 0 || p.mouseY < 0 || p.mouseX > p.canvasSize.x || p.mouseY > p.canvasSize.y);

	p.canvasSize = new Vec2D(600, 400, false);
	p.centerCoords = new Vec2D(p.canvasSize.x / 2, p.canvasSize.y / 2,false);

	p.point = null;
  
	p.getVector = () => {
		if (p.point) {
			return new Vec2D(p.centerCoords.x - p.point.x, p.centerCoords.y - p.point.y,true);
		}
	};

	p.setup = () => {
		p.createCanvas(p.canvasSize.x, p.canvasSize.y);
	};
	p.draw = () => {
		p.background(255, 255, 255);
		p.noFill();
		p.stroke(0, 0, 0);
		p.ellipse(p.centerCoords.x, p.centerCoords.y, 100, 100);


		p.beginShape();
		p.vertex(300, 200);
    if (!p.point) {
      if(!p.mouseInFrame()) return;
			p.vertex(p.mouseX, p.mouseY);
		} else {
			p.vertex(p.point.x, p.point.y);
		}
		p.endShape();

    if(p.normalized) {
      p.text(`x = ${p.normalized.x}\ny = ${p.normalized.y}`,400,100);
      p.displayNormalized();
    }
	};

	p.mouseClicked = () => {
    if(!p.mouseInFrame()) return;
		p.point = { x: p.mouseX, y: p.mouseY };
	};
}



export const demoAnimation = new p5(circleAnimation, "demo");
