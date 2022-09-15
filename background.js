export default class Background {
  frames = new Array(24);
  frame = 0;

  constructor() {
    this.load();
  }

  /**
   * Purpose: Creates and loads an array of background images.
   * Images created by domil123456.
   * From: https://dynamicwallpaper.club/wallpaper/72omz5ynq4
   */
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
