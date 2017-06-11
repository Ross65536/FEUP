package com.feup.superslimefootball.controller.entities.GdxAI;

import com.badlogic.gdx.ai.steer.Steerable;
import com.badlogic.gdx.ai.steer.SteeringAcceleration;
import com.badlogic.gdx.ai.steer.SteeringBehavior;
import com.badlogic.gdx.ai.utils.Location;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.feup.superslimefootball.controller.entities.SlimeBodyBehaviours.SlimeBodyBehaviour;
import com.feup.superslimefootball.controller.entities.SlimeBodyBehaviours.SlimeBodyNormalBehaviour;

/**
 * Created by afonso on 6/2/17.
 */

public class B2dSteeringBody implements Steerable<Vector2> {

    private Body body;
    boolean tagged;
    float boundingRadius;
    float maxLinearSpeed;
    float maxLinearAcceleration;
    float maxAngularSpeed;
    float maxAngularAcceleration;

    private SlimeBodyBehaviour slimeBodyBehaviour;

    SteeringBehavior<Vector2>behavior;
    SteeringAcceleration<Vector2> steergOutput;

    public B2dSteeringBody(Body body, float boundingRadius){
        this.body = body;
        this.boundingRadius = boundingRadius;
        this.maxLinearSpeed = 500;
        this.maxLinearAcceleration = 5000;
        this.maxAngularSpeed = 30;
        this.maxAngularAcceleration = 5;

        this.tagged = false;
        this.steergOutput = new SteeringAcceleration<Vector2>(new Vector2());

        this.slimeBodyBehaviour = new SlimeBodyNormalBehaviour(this.body);
    }

    public void update(float delta){
        if(behavior != null){
            behavior.calculateSteering(steergOutput);
            applySteering(delta);
        }
    }

    private void applySteering(float delta){
        boolean anyAccelerations = false;

        if(!steergOutput.linear.isZero()){
            Vector2 force = steergOutput.linear.scl(delta);
            if(force.y > force.x && force.y > 25) {
                force.y = 25;
                force.x = force.x / 2;
            }
            body.applyForceToCenter(force, true);
            anyAccelerations = true;
        }

        if(anyAccelerations){
            Vector2 velocity = body.getLinearVelocity();
            float currentSpeedSquare = velocity.len2();
            if(currentSpeedSquare > maxLinearSpeed * maxLinearSpeed)
                body.setLinearVelocity(velocity.scl(maxLinearSpeed / (float) Math.sqrt(currentSpeedSquare)));
        }


    }

    @Override
    public Vector2 getLinearVelocity() {
        return body.getLinearVelocity();
    }

    @Override
    public float getAngularVelocity() {
        return body.getAngularVelocity();
    }

    @Override
    public float getBoundingRadius() {
        return boundingRadius;
    }

    @Override
    public boolean isTagged() {
        return tagged;
    }

    @Override
    public void setTagged(boolean tagged) {
        this.tagged = tagged;
    }

    @Override
    public float getZeroLinearSpeedThreshold() {
        return 0;
    }

    @Override
    public void setZeroLinearSpeedThreshold(float value) {

    }

    @Override
    public float getMaxLinearSpeed() {
        return maxLinearSpeed;
    }

    @Override
    public void setMaxLinearSpeed(float maxLinearSpeed) {
        this.maxLinearSpeed = maxLinearSpeed;
    }

    @Override
    public float getMaxLinearAcceleration() {
        return maxLinearAcceleration;
    }

    @Override
    public void setMaxLinearAcceleration(float maxLinearAcceleration) {
        this.maxLinearAcceleration = maxLinearAcceleration;
    }

    @Override
    public float getMaxAngularSpeed() {
        return body.getAngularVelocity();
    }

    @Override
    public void setMaxAngularSpeed(float maxAngularSpeed) {
        this.maxAngularSpeed = maxAngularSpeed;
    }

    @Override
    public float getMaxAngularAcceleration() {
        return maxAngularAcceleration;
    }

    @Override
    public void setMaxAngularAcceleration(float maxAngularAcceleration) {
        this.maxAngularAcceleration = maxAngularAcceleration;
    }

    @Override
    public Vector2 getPosition() {
        return body.getPosition();
    }

    @Override
    public float getOrientation() {
        return body.getAngle();
    }

    @Override
    public void setOrientation(float orientation) {

    }

    @Override
    public float vectorToAngle(Vector2 vector) {
        return (float) Math.atan2(-vector.x,vector.y);
    }

    @Override
    public Vector2 angleToVector(Vector2 outVector, float angle) {
        outVector.x = -(float)Math.sin(angle);
        outVector.y = (float)Math.cos(angle);
        return  outVector;
    }

    @Override
    public Location<Vector2> newLocation() {
        return null;
    }

    /**
     * gets the body
     */


    public Body getBody() {
        return body;
    }

    /**
     * sets the behavior
     * @param behavior
     */
    public void setBehavior(SteeringBehavior<Vector2> behavior){
        this.behavior = behavior;
    }

    /**
     * gets the behavior
     * @return
     */
    public SteeringBehavior<Vector2> getBehavior() {
        return behavior;
    }

}
