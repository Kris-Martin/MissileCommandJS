/**
 * Based on Vec2 class from UNE COSC250 Boids project,
 * src: https://github.com/UNEcosc250/2018assignment2/blob/master/src/main/scala/cosc250/boids/Vec2.scala
 * created by Will Billingsley https://github.com/wbillingsley,
 * ported from Scala to JavaScript by Kris Martin.
 */

/**
 * A vector with an x and y value.
 */
export default class Vector {
  x;
  y;

  /**
   * Creates a vector with an x and y value.
   * This could represent an (x, y) position, or an (vx, vy) velocity,
   * or an (ax, ay) acceleration.
   * @param {number} x
   * @param {number} y
   * */
  constructor(x = 0, y = 0) {
    this.x = x;
    this.y = y;
  }

  /**
   * Set position of this vector.
   * @param {Vector} position
   */
  set(position) {
    this.x = position.x;
    this.y = position.y;
  }

  /**
   * Add this vector to another.
   * @param {Vector} vector
   */
  add(vector) {
    return new Vector(this.x + vector.x, this.y + vector.y);
  }

  /**
   * Subtract the other vector from this one.
   * @param {Vector} vector
   */
  subtract(vector) {
    return new Vector(this.x - vector.x, this.y - vector.y);
  }

  /**
   * Multiplication by a scalar (number). Multiplies the x and y values by n.
   * eg, Vector(7, 9) * 2 == Vector(14, 18).
   * @param {number} n
   */
  multiply(n) {
    return new Vector(this.x * n, this.y * n);
  }

  /**
   * Divide by a scalar (number). Divides the x and y values by n.
   * eg, Vec2(14, 18) / 2 == Vec2(7, 9).
   * @param {number} n
   */
  divide(n) {
    return new Vector(this.x / n, this.y / n);
  }

  /**
   * Returns the angle this vector makes from the origin.
   * Imagine this vector is an arrow on graph-paper from (0,0) to (x,y),
   * theta is the angle from the x axis.
   */
  get theta() {
    return this.#calcTheta();
  }

  #calcTheta() {
    return Math.atan2(this.y, this.x);
  }

  /**
   * Returns the magnitude of this vector.
   * Imagine this vector is an arrow on graph-paper from (0,0) to (x,y),
   * magnitude is the length of the arrow.
   */
  get magnitude() {
    return this.#calcMagnitude();
  }

  #calcMagnitude() {
    return Math.sqrt(Math.pow(this.x, 2) + Math.pow(this.y, 2));
  }

  /**
   * Returns a vector that has the same angle (theta)
   * but a magnitude (arrow length) of 1
   * @return {Vector}
   */
  get normalised() {
    return this.#calcNormalised();
  }

  #calcNormalised() {
    return Vector.fromRTheta(this.theta, 1);
  }

  /**
   * If the magnitude is greater than mag,
   * returns a vector that has the same angle (theta)
   * but a magnitude (arrow length) of mag.
   *
   * Otherwise, if this vector is shorter than mag, just returns this vector.
   * @param {number} mag - upper limit of the magnitude this vector should have.
   * @return {Vector} a vector of magnitude equal to param mag or less.
   */
  limit(mag) {
    if (this.magnitude > mag) {
      return Vector.fromRTheta(this.theta, mag);
    } else return this;
  }

  // Static helper functions

  /**
   * Takes an angle (theta) and a length (r), and returns a Vector representing
   * that arrow. Note that theta is measured in radians (there are 2 * PI
   * radians in a circle rather than 360 degrees in a circle).
   *
   * @param {number} theta - angle in radians
   * @param {number} r - length
   * @return {Vector} Vector representing the arrow to theta at a dist of r.
   */
  static fromRTheta(theta, r) {
    return new Vector(r * Math.cos(theta), r * Math.sin(theta));
  }

  /**
   * Returns a vector of magnitude n in a random direction
   * @param {number} n - magnitude
   * @return {Vector} Vector
   */
  static randomDir(n) {
    const theta = Math.random() * Math.PI * 2;
    return Vector.fromRTheta(n, theta);
  }
}
