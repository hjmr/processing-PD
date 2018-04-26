public class TFTAgent extends Agent {
    int prevOpponentsAction;
 
    public int getType() {
        return AgentType.TFT;
    }
   
    public void prepareForGame() {
        prevOpponentsAction = AgentAction.C;
    }

    public int selectAction() {
        return prevOpponentsAction;
    }

    public void notifyOpponentsAction(int act) {
        prevOpponentsAction = act;
    }
}