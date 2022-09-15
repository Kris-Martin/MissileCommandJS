export class Background {
  frames = new Array(24);
  num = 0;

  constructor() {
    this.load();
  }

  load() {
    for (let i = 0; i < this.frames.length; i++) {
      const img = new Image();
      img.src = `assets/images/background/affinitywallpaper-${i + 1}.png`;
      this.frames[i] = img;
    }
  }

  displayGround(canvas, ctx) {
    ctx.fillStyle = '#834444';
    ctx.fillRect(0, canvas.height - 15, canvas.width, 15);
  }

  // Changes background image using global time variable every 1200 ticks.
  update(tick) {
    if (this.num < this.frames.length && tick % 1200 == 0 && tick !== 0) {
      this.num++;
    }

    if (this.num >= this.frames.length) {
      this.num = 0;
    }
  }

  draw(canvas, ctx, tick) {
    ctx.drawImage(this.frames[this.num], 0, 0, canvas.width, canvas.height);
    this.displayGround(canvas, ctx);
    this.update(tick);
  }
}
