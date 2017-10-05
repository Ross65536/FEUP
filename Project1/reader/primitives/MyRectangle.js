/**
 * MyRectangle
 * @param scene
 * @param vertex1 top left vertex
 * @param vertex2  right-bottom vertex
 * @param minS  texture coordinates
 * @param maxS  texture coordinates
 * @param minT  texture coordinates
 * @param maxT  texture coordinates
 * @constructor
 */

function MyRectangle(scene, vertex1, vertex2){ //vertex1 -> left-top, vertex2 -> right-bottom
    CGFobject.call(this, scene);

    this.vertex1 = vertex1;
    this.vertex2 = vertex2;

    this.minS = 0.0;
    this.minT = 0.0;
    this.maxS = 1.0;
    this.maxT = 1.0;

    this.initBuffers();
};

MyRectangle.prototype = Object.create(CGFobject.prototype);
MyRectangle.prototype.constructor = MyRectangle;

/**
 * Initializes the buffers
 */

MyRectangle.prototype.initBuffers = function() {

    this.vertices = [
        this.vertex1.x, this.vertex1.y, 0,
        this.vertex2.x, this.vertex1.y, 0,
        this.vertex2.x, this.vertex2.y, 0,
        this.vertex1.x, this.vertex2.y, 0
    ];

    this.indices = [
        2, 1, 0,
        0, 3, 2
    ];

    this.normals = [
        0, 0, 1,
        0, 0, 1,
        0, 0, 1,
        0, 0, 1
    ];

    this.texCoords = [
        this.minS,this.maxT,
        this.maxS,this.maxT,
        this.maxS,this.minT,
        this.minS,this.minT
    ];

    this.primitiveType = this.scene.gl.TRIANGLES;
    this.initGLBuffers();
}


//TODO: Set amplification Factors

/**
 * Updates the Triangle amplification factors
 * @param amplifFactorS s domain amplification factor
 * @param amplifFactorT t domain amplification factor
 */
MyRectangle.prototype.setAmplifFactor = function(amplifFactorS, amplifFactorT) {


}