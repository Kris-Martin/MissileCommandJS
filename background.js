import { images } from './missile-command.js';

export default class Background {
  frames = images.backgroundFrames;
  frame = 0;

  constructor() {}

  displayGround(canvas, ctx) {
    ctx.fillStyle = '#834444';
    ctx.fillRect(0, canvas.height - 15, canvas.width, 15);
  }

  // Changes background image using global time variable every 1200 ticks.
  update(tick) {
    if (this.frame < this.frames.length && tick % 1200 == 0 && tick !== 0) {
      this.frame++;
    }

    if (this.frame >= this.frames.length) {
      this.frame = 0;
    }
  }

  draw(canvas, ctx, tick) {
    ctx.drawImage(this.frames[this.frame], 0, 0, canvas.width, canvas.height);
    this.displayGround(canvas, ctx);
    this.update(tick);
  }
}
