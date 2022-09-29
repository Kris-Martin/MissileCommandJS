import Canvas from './canvas.js';
import { images } from './missile-command.js';
import { Settings } from './settings.js';
import Vector from './vector.js';

export default class Background {
  frames = images.backgroundFrames;
  frame = 17;

  position = new Vector(0, 0);
  width;
  height;
  static defaultGroundHeight = 15;

  ground = {
    color: '#834444',
    position: new Vector(),
    width: 0,
    defaultHeight: Background.defaultGroundHeight,
    height: 0,
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
   * @param {Canvas} canvas
   */
  constructor(canvas) {
    this.width = canvas.width;
    this.height = canvas.height;
    this.ground.height =
      (this.ground.defaultHeight / canvas.defaultHeight) * canvas.height;
    this.ground.position.y = this.height - this.ground.height;
    this.ground.width = this.width;

    Background.groundHeight = this.ground.height;
  }

  /**
   * Update background frame every game hour.
   * @param {number} tick
   */
  update(tick) {
    if (
      this.frame < this.frames.length &&
      tick % Settings.ticksPerHour === 0 &&
      tick !== 0
    ) {
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
    this.update(tick);
  }
}
