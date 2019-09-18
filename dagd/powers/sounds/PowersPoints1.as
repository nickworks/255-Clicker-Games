package dagd.powers.sounds {

	import flash.media.Sound;
	import flash.media.SoundTransform;

	public class PowersPoints1 extends Sound {

		var soundTran: SoundTransform = new SoundTransform(1, 0);
		var volume: Number = 1;

		public function PowersPoints1() {
			// constructor code
		}

		public function update() {
			soundTran.volume = lerp(soundTran.volume, volume, 0.9);
		}

		public static function lerp(pt1: Number, pt2: Number, f: Number):Number {
			var x: Number = f * pt1 + (1 - f) * pt2;

			return new Number(x);
		}
	}

}