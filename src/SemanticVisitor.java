import java.util.LinkedList;

public class SemanticVisitor implements ParserVisitor {

    SymbolTableContextManager symbolTableContextManager;

    public SemanticVisitor(SymbolTable symbolTable) {
        this.symbolTableContextManager = new SymbolTableContextManager(symbolTable);

    }

    public Object visit(ASTerror_skipto node, Object data) {
        return null;
    }

    public Object visit(ASTerror_skipto_andEat node, Object data) {
        return null;
    }

    public Object visit(SimpleNode node, Object data) {
        return null;
    }

    public Object visit(ASTStart node, Object data) {

        node.jjtGetChild(0).jjtAccept(this, data);

        return null;
    }

    public Object visit(ASTModule node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTDeclaration node, Object data) {
        return null;
    }

    public Object visit(ASTScalarDeclaration node, Object data) {
        return null;
    }

    public Object visit(ASTSign node, Object data) {
        return null;
    }

    public Object visit(ASTScalar node, Object data) {
        return null;
    }

    public Object visit(ASTArrayDeclaration node, Object data) {
        return null;
    }

    public Object visit(ASTFunction node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTReturn node, Object data) {
        return null;
    }

    public Object visit(ASTParameters node, Object data) {
        return null;
    }

    public Object visit(ASTVariable node, Object data) {

        return (Element) this.symbolTableContextManager.getCurrentSymbolTable().getElement((String) node.jjtGetValue());
    }

    public Object visit(ASTArrayElement node, Object data) {
        return null;
    }

    public Object visit(ASTStatements node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTAssign node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTOperation node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTAccess node, Object data) {
        return null;
    }

    public Object visit(ASTTerm node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTFunctionName node, Object data) {
        return null;
    }

    public Object visit(ASTSize node, Object data) {
        return null;
    }

    public Object visit(ASTConditionalOperation node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTWhile node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTIf node, Object data) {

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            node.jjtGetChild(i).jjtAccept(this, data);
        }

        return null;
    }

    public Object visit(ASTCall node, Object data) {

        if (node.jjtGetNumChildren() == 1) {

            Element function = this.symbolTableContextManager.getRootSymbolTable().getElement((String) node.jjtGetValue());

            LinkedList<Element> parameters = (LinkedList<Element>) node.jjtGetChild(0).jjtAccept(this, data);

            LinkedList<Element> args = function.getArguments();

            int aux = args.size();

            if (parameters.size() != args.size()) {

                SemanticManager.addError(node.line, "Illegal number of arguments on " + node.jjtGetValue() + " Should be " + args.size() + " argument(s).");

                if (aux > parameters.size()) {
                    aux = parameters.size();
                }
            }

            for (int i = 0; i < aux; i++) {

                if (parameters.get(i) != args.get(i)) {
                    SemanticManager.addError(node.line,
                            "Argument " + parameters.get(i).getName()
                                    + " type error! Expected "
                                    + args.get(i).getTypeStr() + " but got " + parameters.get(i).getTypeStr() + " instead!");
                }
            }
        }

        return null;
    }

    public Object visit(ASTArgumentList node, Object data) {

        LinkedList<Element> vars = new LinkedList<Element>();

        for (int i = 0; i < node.jjtGetNumChildren(); i++) {
            vars.add((Element) node.jjtGetChild(i).jjtAccept(this, data));
        }

        return vars;
    }

    public Object visit(ASTString node, Object data) {
        return null;
    }
}
