package dagd.takens {

	import dagd.core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Mouse;
	import dagd.takens.Cow;
	import dagd.takens.UFO;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import dagd.takens.DigitalRide;
	import dagd.takens.Meteor;
	import dagd.takens.Rocket;
	import dagd.takens.Person;
	import dagd.takens.*;
	import dagd.core.App;
	import dagd.takens.House;
	import flash.display3D.IndexBuffer3D;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import dagd.petzak.GoldFish;
	import flash.media.SoundTransform;
	import dagd.petzak.Background;


	public class GameTakens extends Game {

		private var ufo: UFO = new UFO;
		private var cows: Array = new Array();
		private var meteors: Array = new Array();
		private var rockets: Array = new Array();
		private var houses: Array = new Array();
		private var evilUfos: Array = new Array();
		private var fuels: Array = new Array();
		private var peoples: Array = new Array();
		private var meteorTimer: int = 500;
		private var cowTimer: int = 40;
		private var rocketTimer: int = 200;
		private var houseTimer: int = 400;
		private var evilUfoTimer: int = 600;
		private var fuelTimer: int = 100;
		public var fuel: int = 3000;
		public var health: Number = 100;
		public var score: int = 0;
		public var hud: GUI;
		public var sc: ScoreBoard;
		private var ticker = 0;
		public var gameOver: Boolean = false;
		private var gameTicks = 0;
		private var go:GO;
		
		private var digitalRide: DigitalRide;
		private var soundChannel: SoundChannel;
		private var musicVolume:SoundTransform;


		public function GameTakens() {
			gameTitle = "Xtraterrestrial";
			creatorName = "Keith Takens";
		}

		override public function onStart(): void {
			addChild(ufo);
			ufo.mouseEnabled = false;
			addEventListener(Event.ENTER_FRAME, gameLoop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pressedKey);
			Mouse.hide();
			digitalRide = new DigitalRide();
			musicVolume = new SoundTransform();
			musicVolume.volume = .15;
			soundChannel = digitalRide.play(0, 999);
			soundChannel.soundTransform = musicVolume;
			var background:Background = new Background();
			background.mouseEnabled = false;
			addChild(background);
			setChildIndex(background,0);
			
			hud = new GUI;
			hud.mouseEnabled = false;
			addChild(hud);
			sc = new ScoreBoard;
			sc.x = 562;
			sc.y = 660;
			addChild(sc);
		}


		override public function onEnd(): void {
			Mouse.show();
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, pressedKey);
			soundChannel.stop();
		}

		private function pressedKey(e: KeyboardEvent): void {
			if (e.keyCode == Keyboard.R) {
				if(gameOver){
				restartGame();
				}
			}

		}
		
		public function restartGame():void {
			gameOver = false;
			removeChild(go);
			gameTicks = 0;
			meteorTimer = 500;
			cowTimer = 40;
			rocketTimer = 200;
			houseTimer = 400;
			evilUfoTimer = 600;
			fuelTimer = 100;
			fuel = 3000;
			health = 100;
			score = 0;

			for (var x = cows.length - 1; x >= 0; x--) {
				removeChild(cows[x]);
				cows[x].dispose();
				cows.removeAt(x);
			}
			for (var h = houses.length - 1; h >= 0; h--) {
				removeChild(houses[h]);
				houses[h].dispose();
				houses.removeAt(h);
				}
			for (var p = peoples.length - 1; p >= 0; p--) {
				removeChild(peoples[p]);
				peoples[p].dispose();
				peoples.removeAt(p);
				}
			for (var ev = evilUfos.length - 1; ev >= 0; ev--) {
				removeChild(evilUfos[ev]);
				evilUfos[ev].dispose();
				evilUfos.removeAt(ev);
				}
			for (var y = meteors.length - 1; y >= 0; y--) {
					removeChild(meteors[y]);
					meteors[y].dispose();
					meteors.removeAt(y);
				}
			for (var f = fuels.length - 1; f >= 0; f--) {
					removeChild(fuels[f]);
					fuels[f].dispose();
					fuels.removeAt(f);
				}
			for (var r = rockets.length - 1; r >= 0; r--) {
					removeChild(rockets[r]);
					rockets[r].dispose();
					rockets.removeAt(r);
				}
		}

		private function gameLoop(e: Event): void {
			ufo.x = mouseX;
			ufo.y = mouseY;
			if (App.main.isPaused || gameOver) return;
			ticker++;
			if (health <= 0 || fuel <= 0) {
				gameOver = true;
				var lose:Lose = new Lose();
					lose.play();
				var g: GO = new GO;
				go = g;
				addChild(go);
			}
			else{
			health += .02;
			}


			doSpawning();
			doUpdating();
			doHud();
			ticker++;
			if (ticker >= 3) {
				ticker = 0;
				score++;
			}
		}

		private function doHud(): void {

			if (health < 0)
				health = 0;
			if (fuel > 3000)
				fuel = 3000;
			var hp: Number = (health / 100)
			if (hp < 0) hp = 0;
			if (hp > 1) hp = 1;
			hud.healthBar.scaleX = hp;

			var fp: Number = (fuel / 3000)
			if (fp < 0) fp = 0;
			if (fp > 1) fp = 1;
			hud.fuelBar.scaleX = fp;
			if(gameTicks > 4000){
			fuel -= 2;
			}
			else if(gameTicks > 1000){
				fuel -=1;
			}
			else{
				fuel -=.3;
			}
			sc.score.text = "Score: " + score;
		}

		private function doSpawning(): void {
			spawnCow();
			spawnRocket();
			spawnMeteor();
			spawnHouse();
			spawnFuel();
			spawnEvilUfo();
			meteorTimer--;
			houseTimer--;
			evilUfoTimer--;
			fuelTimer--;
			rocketTimer--;
			cowTimer--;

		}
		
		public function hurtSound(): void{
			var meteorSound:MeteorHit = new MeteorHit();
						meteorSound.soundTransform = 100;
						meteorSound.play();
		}

		private function doUpdating(): void {
			gameTicks ++;
			
			for (var x = cows.length - 1; x >= 0; x--) {
				cows[x].update();
				if (cows[x].isDead) {
					if (cows[x].wasClicked) {
						health += 2;
						score += 50;
						fuel += 50;
						var cS:CowNoise = new CowNoise();
						cS.play();
						if (health > 100)
							health = 100;
					}
					removeChild(cows[x]);
					cows[x].dispose();
					cows.removeAt(x);
				}

			}

			for (var h = houses.length - 1; h >= 0; h--) {
				houses[h].update();
				if (houses[h].isDead) {
					if (houses[h].wasClicked) {
						//spawn people
						spawnPeople(Math.round(Math.random() * 3), houses[h].x, houses[h].y);
						score += 10;
						health += 2;
					}
					removeChild(houses[h]);
					houses[h].dispose();
					houses.removeAt(h);
				}

			}


			for (var p = peoples.length - 1; p >= 0; p--) {
				peoples[p].update();
				if (peoples[p].isDead) {
					if (peoples[p].wasClicked) {
						//spawn people
						score += 150;
						health += 5;
					}
					removeChild(peoples[p]);
					peoples[p].dispose();
					peoples.removeAt(p);
				}

			}

			for (var ev = evilUfos.length - 1; ev >= 0; ev--) {
				evilUfos[ev].update();
				if (evilUfos[ev].isDead) {
					removeChild(evilUfos[ev]);
					evilUfos[ev].dispose();
					evilUfos.removeAt(ev);
				}

			}


			for (var y = meteors.length - 1; y >= 0; y--) {
				meteors[y].update();
				if (meteors[y].isDead) {
					if (meteors[y].wasHit) {
						health -= 20;
						//var mh:SounChannel = new SoundChannel();
						//mh.
						hurtSound();
					}
					removeChild(meteors[y]);
					meteors[y].dispose();
					
					meteors.removeAt(y);
				}

			}

			for (var f = fuels.length - 1; f >= 0; f--) {
				fuels[f].update();
				if (fuels[f].isDead) {
					if (fuels[f].wasClicked) {
						fuel += 250;
						score += 100;
						var fS:FuelSound = new FuelSound();
						fS.play();
					}
					removeChild(fuels[f]);
					fuels[f].dispose();
					fuels.removeAt(f);
				}

			}

			for (var r = rockets.length - 1; r >= 0; r--) {
				rockets[r].update();
				if (rockets[r].isDead) {
					if (rockets[r].wasHit) {
						health -= 35;
						hurtSound();
					}
					removeChild(rockets[r]);
					rockets[r].dispose();
					rockets.removeAt(r);
				}

			}


		}


		private function spawnCow(): void {
			if (cowTimer <= 0) {
				cowTimer += Math.random() * 200 + 50;
				var c: Cow = new Cow;
				cows.push(c);
				addChild(c);
				setChildIndex(c, 1);
				var side = Math.random() * 10;
				var xvelocity = (Math.random() * 2) + 2;
				if (side <= 5) {
					c.x = -10;
					c.velocityX = xvelocity;
				} else {
					c.x = 800;
					c.velocityX = -xvelocity;
					c.scaleX = -c.scaleX;
				}
				//c.x = Math.random() * 800;
				c.y = Math.random() * 600 + 50;
				c.velocityY = Math.random() * 3;
			}
			//math.rand
		}


		private function spawnHouse(): void {
			if (houseTimer <= 0) {
				houseTimer += Math.random() * 450 + 50;
				var h: House = new House;
				houses.push(h);
				addChild(h);
				setChildIndex(h, 1);
				var side = Math.random() * 10;
				var xvelocity = 2;
				if (side <= 5) {
					h.x = -10;
					h.velocityX = xvelocity;
				} else {
					h.x = 800;
					h.velocityX = -xvelocity;
				}
				//c.x = Math.random() * 800;
				h.y = Math.random() * 400 + 180;
			}
		}

		private function spawnRocket(): void {
			if (rocketTimer <= 0) {
				rocketTimer += Math.random() * 400 + 50;
				var r: Rocket = new Rocket();
				var index: int = getChildIndex(ufo);
				addChild(r);
				setChildIndex(r, 1);
				var rS:RocketSound = new RocketSound();
				//evilsound.play();
				var rocketTransform:SoundTransform = new SoundTransform();
				var rocketChannel:SoundChannel = new SoundChannel();
				rocketChannel = rS.play();
				rocketTransform.volume = .8;
				rocketChannel.soundTransform = rocketTransform;
				r.x = Math.random() * 700 + 50;
				r.velocityX = Math.random() * 5 + 8;
				if (r.x > 400)
					r.velocityX *= -1;
				r.y = 720;
				rockets.push(r);
				//give it a velocity


			}

		}

		private function spawnPeople(ammount: int, locationX: int, locationY: int): void {
			for (var p: int = 0; p < ammount; p++) {
				var pe: Person = new Person();
				pe.x = locationX;
				pe.y = locationY;
				addChild(pe);
				setChildIndex(pe, 1);
				peoples.push(pe);
			}


		}

		private function spawnMeteor(): void {
			if (meteorTimer <= 0) {
				if (gameTicks > 3600) {
					meteorTimer += Math.random() * 50;
				} else if (gameTicks > 1000) {
					meteorTimer += Math.random() * 120;
				} else {
					meteorTimer += Math.random() * 250;
				}
				var m: Meteor = new Meteor();
				addChild(m);
				setChildIndex(m, 1);
				m.x = Math.random() * 800;
				m.y = -20;
				meteors.push(m);
				//give it a velocity


			}

		}

		private function spawnFuel(): void {

			if (fuelTimer <= 0) {
				if(gameTicks > 4000){
					fuelTimer += Math.random() * 150;//make fuel more common when fuel bar decreases faster from difficulty
				}
				else{
					fuelTimer += Math.random() * 350;
				}
				var f: Fuel = new Fuel();
				addChild(f);
				setChildIndex(f, 1);
				f.x = Math.random() * 700 + 50;
				f.y = -10;
				fuels.push(f);
				//give it a velocity


			}
		}

		private function spawnEvilUfo(): void {
			if (evilUfoTimer <= 0) {
				evilUfoTimer += Math.random() * 250 + 50;
				var ev: EvilUFO = new EvilUFO(this);
				var evilsound:Laser = new Laser();
				//evilsound.play();
				var evilSoundTransform:SoundTransform = new SoundTransform();
				var eSC:SoundChannel = new SoundChannel();
				eSC = evilsound.play();
				evilSoundTransform.volume = .12;
				eSC.soundTransform = evilSoundTransform;
				evilUfos.push(ev);
				addChild(ev);
				setChildIndex(ev, 1);
				var side = Math.random() * 10;
				var xvelocity = 4;
				if (side <= 5) {
					ev.x = -10;
					ev.velocityX = xvelocity;
				} else {
					ev.x = 800;
					ev.velocityX = -xvelocity;
				}
				//c.x = Math.random() * 800;
				ev.y = Math.random() * 400 + 180;
			}
		}
	}
}