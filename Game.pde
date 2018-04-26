public class Game {
    static float w = 0.9;
    static int[][] table = {
        {3,0},
        {5,1}
    };

    static void play(Agent p1, Agent p2) {
        p1.prepareForGame();
        p2.prepareForGame();
        do {
            int a1 = p1.selectAction();
            int a2 = p2.selectAction();

            p1.addPoint(table[a1][a2]);
            p2.addPoint(table[a2][a1]);

            p1.notifyOpponentsAction(a2);
            p2.notifyOpponentsAction(a1);
        } while( random(1) < w );
    }
}