class App extends hxd.App {

	public var t: h2d.HtmlText;

  override function init() {
		final gluten = hxd.Res.load("gluten-medium.fnt").to(hxd.res.BitmapFont);
		final font = gluten.toSdfFont(16, MultiChannel);

		var text1 = new h2d.HtmlText(font);
		text1.maxWidth = 330;
		text1.x = 10;
		text1.y = 10;
		text1.text = "You may not have enough dice faces to complete the ambition. Continue ?";
		this.s2d.addChild(text1);

		var text2 = new h2d.HtmlText(font);
		text2.maxWidth = 331;
		text2.text = "You may not have enough dice faces to complete the ambition. Continue ?";
		text2.x = 10;
		text2.y = 50;
		this.s2d.addChild(text2);

		var text3 = new h2d.HtmlText(font);
		text3.maxWidth = 329;
		text3.text = "You may not have enough dice faces to complete the ambition. Continue ?";
		text3.x = 10;
		text3.y = 90;
		this.s2d.addChild(text3);

		var text4 = new h2d.HtmlText(font);
		text4.text = "Put string here to try and find another string that might have the same problem.";
		this.actualMaxWidth = text4.getSize().width;
		text4.maxWidth = 0;
		text4.x = 10;
		text4.y = 130;
		this.s2d.addChild(text4);
		this.t = text4;
  }

	var actualMaxWidth: Float = 1000000;
	override function update(dt: Float) {
		if (this.t == null) return;
		this.t.maxWidth += 1;
		if (this.t.maxWidth >= actualMaxWidth) {
			trace('Bug not found');
			this.t = null;
			return;
		}
		if (this.t.getSize().width >= this.actualMaxWidth) {
			trace('Bug found at width: ${this.t.maxWidth}');
			this.t = null;
		}
	}

  static function main() {
    hxd.Res.initEmbed();
    new App();
  }
}
