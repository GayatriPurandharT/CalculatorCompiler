/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author st119978
 */
public class Token {
    public double value;
    public String prefix;
    public String postfix;
    public String infix;
    
    public Token(Double value, String prefix, String postfix, String infix){
        this.value = value;
        this.prefix = prefix;
        this.postfix = postfix;
        this.infix = infix;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getPostfix() {
        return postfix;
    }

    public void setPostfix(String postfix) {
        this.postfix = postfix;
    }

    public String getInfix() {
        return infix;
    }

    public void setInfix(String infix) {
        this.infix = infix;
    }

    @Override
    public String toString() {
        return "Token{" +
                "value=" + value +
                ", prefix='" + prefix + '\'' +
                ", postfix='" + postfix + '\'' +
                ", infix='" + infix + '\'' +
                '}';
    }
}
