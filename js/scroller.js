    function scrollerObj(name,initH,initW,heightB,widthB,content,initBg,Bg,speed,initFl){
    //**data**//
    this.name=name;
    this.initH=initH;
    this.initW=initW;
    this.heightB=heightB;
    this.widthB=widthB;
    this.content=content;
    this.initBg=initBg;
    this.Bg=Bg;
    this.iniFl=initFl;
    this.speed=parseInt(speed);
    this.timer = name + "Timer";
    this.elem;
    //**methods**//
    this.getElement = getElement;
    this.createLayer=createLayer;
    this.scrollLayer = scrollLayer; 
    this.scrollLoop=scrollLoop;
    //**initiate methods**//
    this.createLayer();
    this.getElement();
    this.scrollLayer();
    }
    //**call this method to stop scrolling**//
    function scrollLoop(s){
    this.speed = s;
    }
    //**pretty obvious**//
    function scrollLayer(){
    if(parseInt(this.elem.style.top)>(this.elem.offsetHeight*(-1))){
        this.elem.style.top = parseInt(this.elem.style.top)-this.speed;
        //alert(parseInt(this.elem.style.top)+"\n"+this.elem.id);
    }
    else {this.elem.style.top = this.initH;}
    }
    //**get the specific dom-expression**//
    function getElement(){
    if(document.getElementById){
        this.elem = document.getElementById(this.name);
        }
    else if (document.all){
    this.elem = document.all[name];
        }
    else if (document.layers){
    this.elem = document.layers[name];
        }
    }
    //**pretty obvious - if NS4 - please upgrade to a standard compliant browser**//
    function createLayer(){
    if(document.getElementById || document.all){
    document.write('<div id="layer'+this.name+'" style="position:relative;overflow:hidden;float:'+this.initFl+';background-color:#'+this.initBg+';border:1px solid black;width:'+this.initW+'px;height:'+this.initH+'px;" onMouseover="'+this.name+'.scrollLoop(0)" onMouseout="'+this.name+'.scrollLoop('+this.speed+')">');
    document.write('<div id="'+this.name+'" style="position:absolute;top:'+this.initH+'px;left:0px;border:0px solid black;width:'+this.widthB+'px;height:'+this.heightB+'px;background-color:#'+this.Bg+'">');
    document.write(this.content);
    document.write('<\/div><\/div>');}
    else if(document.layers){
        document.write('<ilayer name="'+this.name+'" bgcolor="#'+this.Bg+'" width="'+this.widthB+'" height="'+this.heightB+'">'+this.content+'<\/ilayer>');
        return;
    }
    if(this.scrollLayer){
      this.timer = setInterval(this.name+'.scrollLayer()','30');
    }
    }

