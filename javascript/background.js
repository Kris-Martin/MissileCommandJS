import { images } from './missile-command.js';
import Vector from './vector.js';

export default class Background {
  frames = images.backgroundFrames;
  frame = 0;

  position = new Vector(0, 0);

  width;
  height;

  groundPosition = new Vector();
  groundWidth;
  groundHeight = 15;

  constructor(canvasWidth, canvasHeight) {
    this.width = canvasWidth;
    this.height = canvasHeight;
    this.groundPosition.y = this.height - this.groundHeight;
    this.groundWidth = this.width;
  }

  /**
   * Draw ground.
   * @param {CanvasRenderingContext2D} ctx - canvas context
   */
  drawGround(ctx) {
    ctx.fillStyle = '#834444';
    ctx.fillRect(
      this.groundPosition.x,
      this.groundPosition.y,
      this.groundWidth,
      this.groundHeight,
    );
  }

  // Changes background image every 1200 ticks.
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
    this.drawGround(ctx);
    this.update(tick);
  }
}
