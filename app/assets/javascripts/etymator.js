var etymator = (function(){
	var 
		configMap = {
			container_id: "etym-container" 
		},
		stateMap = {
			count: null,
			duration: 1000,
			controller: null,
		},
		init
	;
	
	init = function(count, duration){
		$("body").click(function(){
			console.log(etymator.getController().scrollPos());
		})
		stateMap.count = count;
		stateMap.duration = duration;
		stateMap.$container = $("#" + configMap.container_id);
		stateMap.controller = new ScrollMagic();
		
		//configure page
		$("body").height(duration * (count + 1));
		
		//add components
		stateMap.controller.addScene(
			etymator.overviewTracker.init(count, duration)
		);
		
		stateMap.controller.addScene(
			etymator.closeups.init(count, duration)
		);
		
		stateMap.controller.addScene(
			etymator.languages.init(count, duration)
		);
	}
	
	getController = function(){
		return stateMap.controller;
	}
	
	return {
		init: init,
		getController: getController
		
	};
})();

etymator.overviewTracker = (function(){
	var
		configMap = {
			scroll_duration: 500,
			height: 30,
			container_id: "overview",
			tracker_id: "overview-tracker"
		},
		stateMap = {
			count: null,
			duration: null
		},
		init
	;
	
	init = function(count, duration){
		stateMap.count = count;
		stateMap.duration = duration;
		stateMap.$container = $("#" + configMap.container_id);
		stateMap.$tracker = $("<div />").attr("id", configMap.tracker_id)
			.css("top","0px").appendTo(stateMap.$container);
		stateMap.$entries = stateMap.$container.find(".entry");
		
		stateMap.scene = new ScrollScene({duration: duration * count});
		stateMap.scene.setTween(
			TweenMax.fromTo(stateMap.$tracker, count, {
				top: "0px",
				ease: Linear.easeNone
			},{
				top: configMap.height * (count - 1) + "px",
				ease: Linear.easeNone
				})
		);
		
		return stateMap.scene;
	}
	
	return {
		init: init
	}
})();

etymator.closeups = (function(){
	var
		configMap = {
			font_sizes: ["0px","200px"],
			font_colors: ["white", "black"],
			container_id: "closeups"
		},
		stateMap = {
			$container : null,
			$closeups : null,
			cur : -1
		},
		init,
		iterate
	;
	
	init = function(count, duration){
		stateMap.$container = $("#" + configMap.container_id);
		stateMap.$closeups = stateMap.$container.find(".entry");
		stateMap.duration = (count * duration) / (count - 1)
		
		stateMap.scenes = stateMap.$closeups.map(function(i, elem){
			var tween = new TimelineMax()
				.add(
					TweenMax.fromTo($(elem).find(".old-word"), stateMap.duration, {
						fontSize: configMap.font_sizes[1],
						color: configMap.font_colors[1]
					},
					 {
						fontSize : configMap.font_sizes[0],
						color: configMap.font_colors[0],
						onReverseComplete: function(){
							iterate(-1);
					}
				}), 0
				)
				.add(
					TweenMax.fromTo($(elem).find(".new-word"), stateMap.duration, {
						fontSize: configMap.font_sizes[0],
						color: configMap.font_colors[0]
					},
					{
						fontSize: configMap.font_sizes[1],
						color: configMap.font_colors[1],
						onComplete: function(){
							iterate(1);
						}
					
					}), 0
				);
				
			return new ScrollScene({duration: duration, offset: stateMap.duration * i }).setTween(tween);
		});
		
		iterate(1);
		
		return $.makeArray( stateMap.scenes );
	};
	
	iterate = function(num){
		console.log(etymator.getController().scrollPos());
		if (stateMap.cur + num in stateMap.$closeups){
			if (stateMap.cur in stateMap.$closeups) $( stateMap.$closeups[stateMap.cur] ).hide();
			stateMap.cur += num;
			
			$( stateMap.$closeups[stateMap.cur] ).show();
		}
	};
	
	return {init: init};
})();

etymator.languages = (function(){
	var
		configMap = {
			container_id: "languages .holder",
			height: 30,
			buffer_height: 15
			
		},
		stateMap = {
			
		},
		init
	;
	
	init = function(count, duration){
		stateMap.count = count;
		stateMap.duration = duration;
		stateMap.$container = $("#" + configMap.container_id);
		stateMap.scene = new ScrollScene({duration: duration * count});
		stateMap.scene.setTween(
			TweenMax.fromTo(stateMap.$container, count, {
				marginTop: "0px",
				ease: Linear.easeNone
			},{
				marginTop: "-" + ((configMap.height * (count - 1))) + "px",
				ease: Linear.easeNone
				})
		);
		
		return stateMap.scene;	
	};
	
	
	return {init: init};
})();