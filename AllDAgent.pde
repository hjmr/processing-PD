public class AllDAgent extends Agent {
    public int getType() {
        return AgentType.AllD;
    }

    public void prepareForGame() {
        // nothing to do
    }

    public int selectAction() {
        return AgentAction.D;
    }

    public void notifyOpponentsAction(int act) {
        // nothing to do
    }
}
