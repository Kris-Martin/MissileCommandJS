import { images } from './missile-command.js';
import Vector from './vector.js';

export default class Background {
  frames = images.backgroundFrames;
  frame = 0;

  position = new Vector(0, 0);
  width;
  height;

  ground = {
    color: '#834444',
    position: new Vector(),
    width: 0,
    height: 15,
    /**
     * Draw ground.
     * @param {CanvasRenderingContext2D} ctx - canvas context
     */
    draw: (ctx) => {
      ctx.fillStyle = this.ground.color;
      ctx.fillRect(
        this.ground.position.x,
        this.ground.position.y,
        this.ground.width,
        this.ground.height,
      );
    },
  };

  /**
   * Create background.
   * @param {number} canvasWidth
   * @param {number} canvasHeight
   */
  constructor(canvasWidth, canvasHeight) {
    this.width = canvasWidth;
    this.height = canvasHeight;
    this.ground.position.y = this.height - this.ground.height;
    this.ground.width = this.width;
  }

  /**
   * Update background frame every 1200 ticks.
   * @param {number} tick
   */
  update(tick) {
    if (this.frame < this.frames.length && tick % 1200 === 0 && tick !== 0) {
      this.frame++;
    }

    if (this.frame >= this.frames.length) {
      this.frame = 0;
    }
  }

  /**
   * Draw background.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   */
  draw(ctx, tick) {
    ctx.drawImage(
      this.frames[this.frame],
      this.position.x,
      this.position.y,
      this.width,
      this.height,
    );
    this.ground.draw(ctx);
    this.update(tick);
  }
}
