// PARAMETRIC TOY SWORD
// by Pjotrx (20131013)
// license: creative commons share alike (non-commercial)

// Including a name in the blade requires the More Fontz! library by
// polymaker (http://www.thingiverse.com/thing:13677)


// USER PARAMETERS

delta=0.5; // fitting margin of connections
myd1a=12.5; // half width of flat part of blade
myd2a=15; // half width of blade including edge
myd1b=6.5; // half width of flat part of connector
myd2b=9; // half width of connector including edge
//name="~Felix~"; // name string (optional)
name="";
seglen=120; // blade segment length
conlen=40; // connector length

scalefactor=1.0;


// parts set 1
scale([scalefactor,scalefactor,scalefactor]){
    /*
	lemseg(-40,0,0,seglen,conlen);
	lemsegtext(-5,0,0,seglen,conlen,name); // uncomment if required
	//lemseg(-5,0,0,seglen,conlen,name);       // comment out if namestring is set
	lemseg2(30,0,0,seglen,conlen);
    */
	
	
	// parts set 2
	
	
	heft2(105,20,0);
	heft(140,120,180);
	heft2(175,20,0);
	kruisstuk(60,15,0);
    
}


use <Aclonica.scad>;  // uncomment if namestring is set

// MODULES

module lembas(x,y,z,a,h,d1,d2,l){
   translate(v=[x,y,z]) rotate(a=a,v=[0,0,1]){

      polyhedron(
          points=[[-d1,0,0], [d1,0,0], [d2,0,h/2], [d1,0,h],
                  [-d1,0,h], [-d2,0,h/2],
                  [-d1,l,0], [d1,l,0], [d2,l,h/2], [d1,l,h],
                  [-d1,l,h], [-d2,l,h/2]],
          triangles=[[0,5,4],[0,3,1],[0,4,3],[1,3,2],
                     [0,1,7], [0,7,6],
                     [1,2,8], [1,8,7], 
                     [2,9,8], [2,3,9],
                     [4,9,3], [4,10,9],
                     [5,10,4], [5,11,10],
                     [0,11,5], [0,6,11],
                     [6,10,11], [6,7,9], [6,9,10], [7,8,9]] 
       );
            

   }
}

module lempunt(x,y,z,a,h,d1,d2,l){
   translate(v=[x,y,z]) rotate(a=a,v=[0,0,1]){

      polyhedron(
          points=[[-d1,0,0], [d1,0,0], [d2,0,h/2], [d1,0,h],
                  [-d1,0,h], [-d2,0,h/2],
                  [0,l-(d2-d1),0], [0,l,h/2], [0,l-(d2-d1),h]],
          triangles=[[0,5,4],[0,3,1],[0,4,3],[1,3,2],
                     [0,1,6], 
                     [1,2,7],[1,7,6],
                     [2,3,7],[3,8,7],
                     [3,4,8],
                     [4,7,8],[5,7,4],
                     [5,0,7],[0,6,7]
                     ]
       );
            

   }
}


module lemseg(x,y,a,l1,l2){
   translate(v=[x,y,0]) rotate(a=a,v=[0,0,1]){
      union(){
        difference(){
           lembas(0,0,0,0,5,myd1a,myd2a,l1);
           lembas(0,-1,-0.01,0,5.02,myd1b+delta,myd2b+delta,l2+1);
        }
        lembas(0,l1-1,0,0,5,myd1b,myd2b,l2+1);
      }
   }
}


module lemseg2(x,y,a,l1,l2){
   translate(v=[x,y,0]) rotate(a=a,v=[0,0,1]){
      union(){
        difference(){
           lembas(0,0,0,0,5,myd1a,myd2a,l1);
           lembas(0,-1,-0.01,0,5.02,myd1b+delta,myd2b+delta,l2+1);
        }
        lempunt(0,l1-0.01,0,0,5,myd1a,myd2a,25);
      }
   }
}

module lemsegtext(x,y,a,l1,l2,lstr){
   translate(v=[x,y,0]) rotate(a=a,v=[0,0,1]){
      difference(){
	      union(){
	        difference(){
	           lembas(0,0,0,0,5,myd1a,myd2a,l1);
	           lembas(0,-1,-0.01,0,5.02,myd1b+delta,9+delta,l2+1);
	        }
	        lembas(0,l1-1,0,0,5,myd1b,myd2b,l2+1);
	      }
        translate(v=[5,l1/2+10,-1]) scale(v=[0.25,0.25,1]) rotate(a=90,v=[0,0,1]) Aclonica(lstr,center=true,height=20,extra=10);

      }
   }
}

module heft(x,y,a){
   translate(v=[x,y,0]) rotate(a=a,v=[0,0,1]){
      union(){
         lembas(0,0,0,0,5,myd1b,myd2b,85+conlen);
         cylinder(r=18,h=5);
         translate(v=[-12,0,0]) cube(size=[24,80,5]);
      }
   }
}

module heft2(x,y,a){
   translate(v=[x,y,0]) rotate(a=a,v=[0,0,1]){
      scale([1,1,0.3]) difference(){
     	 union(){
	         sphere(r=18,h=5);
	         translate(v=[0,0,0]) rotate(a=-90,v=[1,0,0]) cylinder(r=12,h=80);
	     }
         translate(v=[-50,-100,-50]) cube(size=[100,200,50]);
      }
   }
}

module kruisstuk(x,y,a){
   translate(v=[x,y,0]) rotate(a=a,v=[0,0,1]){
      difference(){
         union(){
            cube(size=[20,120,5]);
            translate(v=[10,0,0]) cylinder(h=5,r=12);
            translate(v=[10,120,0]) cylinder(h=5,r=12);
         }
         translate(v=[7.5-delta/2,60,-1]) rotate(a=90,v=[0,0,1]) rotate(a=90,v=[1,0,0]) lembas(0,0,0,0,5+delta,6+delta,9+delta,20);
      }
   }
}







//
