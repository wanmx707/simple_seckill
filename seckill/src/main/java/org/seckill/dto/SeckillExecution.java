package org.seckill.dto;

import org.seckill.entity.SuccessKilled;
import org.seckill.enums.SeckillStatEnum;

/**
 * 封装秒杀执行后的结果
 */
public class SeckillExecution {
    private long seckillId;

    //秒杀结果状态
    private int state;

    //状态标识
    private String stateinfo;

    private SuccessKilled successKilled;

    public SeckillExecution(long seckillId, SeckillStatEnum statenum) {
        this.seckillId = seckillId;
        this.state = statenum.getState();
        this.stateinfo = statenum.getStatsinfo();
    }

    @Override
    public String toString() {
        return "SeckillExecution{" +
                "seckillId=" + seckillId +
                ", state=" + state +
                ", stateinfo='" + stateinfo + '\'' +
                ", successKilled=" + successKilled +
                '}';
    }

    public SeckillExecution(long seckillId, SeckillStatEnum statenum, SuccessKilled successKilled) {
        this.seckillId = seckillId;
        this.state = statenum.getState();
        this.stateinfo = statenum.getStatsinfo();
        this.successKilled = successKilled;
    }

    public long getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(long seckillId) {
        this.seckillId = seckillId;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateinfo() {
        return stateinfo;
    }

    public void setStateinfo(String stateinfo) {
        this.stateinfo = stateinfo;
    }

    public SuccessKilled getSuccessKilled() {
        return successKilled;
    }

    public void setSuccessKilled(SuccessKilled successKilled) {
        this.successKilled = successKilled;
    }
}
