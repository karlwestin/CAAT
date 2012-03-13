describe("ActorCSS", function() {

    beforeEach(function() {
        this.actor = new CAAT.Actor();
        this.director = new CAAT.Director();
    });


    describe("Performance improvements in the animate() method", function() {
        it("should not call 'style' when nothing has changed", function() {
            this.actor.animate(this.director, 300); // let it run once to get wasVisible set!
            spyOn(this.actor, "style");
            this.actor.animate(this.director, 300);
            expect(this.actor.style).not.toHaveBeenCalled();
        });

        it("should not call 'styleAlpha' when nothing has changed", function() {
            spyOn(this.actor, "styleAlpha");
            this.actor.animate(this.director, 300);
            expect(this.actor.styleAlpha).not.toHaveBeenCalled();
        });

        describe("Alpha", function() {
            it("should call 'style' from animate when alpha has changed", function() {
                spyOn(this.actor, "styleAlpha");
                this.actor.setAlpha(0.6);
                this.actor.animate(this.director, 300);
                expect(this.actor.styleAlpha).toHaveBeenCalled();
            });
            
            it("should change opacity when alpha is changed", function() {
                this.actor.setAlpha(0.6);
                this.actor.animate(this.director, 300);
                expect(this.actor.domElement.style.opacity).toEqual("0.6");
            });
        });
        
        describe("Visible", function() {
            it("should call 'style' from animate when visible has changed", function() {
                spyOn(this.actor, "style");
                this.actor.setVisible(false);
                this.actor.animate(this.director, 300);
                expect(this.actor.style).toHaveBeenCalled();
            });   

            it("should set the domElement.style to 'none/block' when visible is changed", function() {
                this.actor.animate(this.director, 300);
                this.actor.setVisible(false);
                this.actor.animate(this.director, 300);
                expect(this.actor.domElement.style.display).toEqual("none");
                this.actor.setVisible(true);
                this.actor.animate(this.director, 400);
                expect(this.actor.domElement.style.display).toEqual("block");
            });               

            it("should disappear when expired, and appear again", function() {
                this.actor.animate(this.director, 300);
                this.actor.setExpired(true);
                expect(this.actor.domElement.style.display).toEqual("none");
                this.actor.animate(this.director, 400);
                this.actor.setFrameTime(600, 10000);
                this.actor.animate(this.director, 800);
                expect(this.actor.domElement.style.display).toEqual("block");
            }); 

            it("should disappear when setOutOfFrameTime, and appear again", function() {
                this.actor.animate(this.director, 300);
                this.actor.setOutOfFrameTime();
                this.actor.animate(this.director, 400);
                expect(this.actor.domElement.style.display).toEqual("none");
                this.actor.setFrameTime(600, 10000);
                this.actor.animate(this.director, 800);
                expect(this.actor.domElement.style.display).toEqual("block");
            });
        });

        describe("Expired", function() {
            it("should not call style when actor is expired", function() {
                this.actor.animate(this.director, 300);
                this.actor.setExpired(true);
                this.actor.animate(this.director, 400);
                spyOn(this.actor, "style");
                this.actor.animate(this.director, 500);
                expect(this.actor.style).not.toHaveBeenCalled();
            });
        });
    
    });


});
