function BezierAnimation(scene, id, bezierPoints, vel) {
  
  Animation.call(this, scene, id);
  
  this.p1 = bezierPoints[0];
  this.p2 = bezierPoints[1];
  this.p3 = bezierPoints[2];
  this.p4 = bezierPoints[3];
  this.vel = vel;
  
  this.distance = Math.sqrt(Math.pow(this.p4.x - this.p1.x, 2) 
                          + Math.pow(this.p4.y - this.p1.y, 2) 
                          + Math.pow(this.p4.z - this.p1.z, 2));
						  
  this.lastCurrentTime = -1;
  this.currentAngle = 0; 
  this.inclination = this.calculateAngle(this.p1,this.p2);
}

BezierAnimation.prototype = Object.create(Animation.prototype);
BezierAnimation.prototype.constructor = BezierAnimation;


BezierAnimation.prototype.update = function(currentTime) {
	var delta, s, totalDistance, t;
	var Q, Qs;
	
	delta = (this.lastCurrentTime == -1) ? 0 : (currentTime - this.lastCurrentTime)/1000;
	this.lastCurrentTime = currentTime;

	totalDistance = this.calculateDistance(this.p1,this.p2,this.p3,this.p4);
	t = this.vel/totalDistance;
	s = delta/t;
	
	Q = this.bezier(s,p1,p2,p3,p4);
	Qs = this.bezierDerivate(s,p1,p2,p3,p4);
	
	this.currentAngle = Math.atan2(Qs.z, Qs.x);
}

BezierAnimation.prototype.calculateAngle = function(point1, point2) {
	return Math.atan2((point2.x - point1.x), (point2.z - point1.z));
}

BezierAnimation.prototype.bezier = function(s, p1, p2, p3, p4){
	var x, y, z;
	
	x = Math.pow((1-s), 3) * this.p1.x + 
            3*s* Math.pow((1-s), 2) * this.p2.x + 
            3*s*s* (1-s) * this.p3.x + 
            s*s*s* this.p4.x;

    y = Math.pow((1-s), 3) * this.p1.y + 
            3*s* Math.pow((1-s), 2) * this.p2.y + 
            3*s*s* (1-s) * this.p3.y + 
            s*s*s* this.p4.y;

    z = Math.pow((1-s), 3) * this.p1.z + 
            3*s* Math.pow((1-s), 2) * this.p2.z + 
            3*s*s* (1-s) * this.p3.z + 
            s*s*s* this.p4.z;
			
	var res = new Vector3(x,y,z);
	return res;
}

BezierAnimation.prototype.bezierDerivate = function(s, p1, p2, p3, p4){
	var x, y, z;
	
	x = -3*Math.pow((1-s), 2) * this.p1.x + 
            (3*Math.pow((1-s),2)-6*s*(1-s))* this.p2.x + 
            (6*s*(1-s) - 3*s*s) * this.p3.x + 
            3*s*s* this.p4.x;

    y = -3*Math.pow((1-s), 2) * this.p1.y + 
            (3*Math.pow((1-s),2)-6*s*(1-s))* this.p2.y + 
            (6*s*(1-s) - 3*s*s) * this.p3.y + 
            3*s*s* this.p4.y;

    z = -3*Math.pow((1-s), 2) * this.p1.z + 
            (3*Math.pow((1-s),2)-6*s*(1-s))* this.p2.z + 
            (6*s*(1-s) - 3*s*s) * this.p3.z + 
            3*s*s* this.p4.z;
			
	var res = new Vector3(x,y,z);
	return res;
}

BezierAnimation.prototype.calculateDistance = function(p1,p2,p3,p4){
	var p12, p123, p23, p234, p34;
	
	p12 = middlePoint(p1,p2);
	p23 = middlePoint(p2,p3);
	p34 = middlePoint(p3,p4);
	p123 = middlePoint(p12,p23);
	p234 = middlePoint(p23,p34);
	
	return (distanceBetweenVertex(p1,p12) + distanceBetweenVertex(p12,p123) + 
			distanceBetweenVertex(p123,p234) + distanceBetweenVertex(p23, p34) +
			distanceBetweenVertex(p34,p4));
}