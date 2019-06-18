package org.seckill.entity;

import java.util.Date;

public class SuccessKilled {
    private long seckillId;

    private long userphone;

    private short state;

    private Date createTime;

    //多对一
    private Seckill seckill;

    public Seckill getSeckill() {
        return seckill;
    }

    public void setSeckill(Seckill seckill) {
        this.seckill = seckill;
    }

    public void setSeckillId(long seckillId) {
        this.seckillId = seckillId;
    }

    public void setUserphone(long userphone) {
        this.userphone = userphone;
    }

    public void setStatus(short state) {
        this.state = state;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public long getSeckillId() {
        return seckillId;
    }

    public long getUserphone() {
        return userphone;
    }

    public short getStatus() {
        return state;
    }

    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public String toString() {
        return "SuccessKilled{" +
                "seckillId=" + seckillId +
                ", userphone=" + userphone +
                ", status=" + state +
                ", createTime=" + createTime +
                '}';
    }
}
