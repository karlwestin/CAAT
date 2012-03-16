describe("Behaviors", function() {

    describe("CAAT.Behavior", function() {

        beforeEach(function() {
            this.b = new CAAT.Behavior();
        });

        describe("Listeners", function() {
            
            it("should not throw error on listener without behaviorExpired", function() {
                this.b.addListener({
                        behaviorStarted: function() {}
                });

            expect(this.b.fireBehaviorExpiredEvent.bind(this.b)).not.toThrow();
            });
        });
    });

});
