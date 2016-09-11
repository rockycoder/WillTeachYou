package com.app.dto;

public class DateRange {

    private Long startTime;
    private Long endTime;

    public DateRange(Long startTime, Long endTime) {
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public DateRange() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;

        if (o == null || getClass() != o.getClass()) return false;

        DateRange dateRange = (DateRange) o;

        return new org.apache.commons.lang3.builder.EqualsBuilder()
                .append(startTime, dateRange.startTime)
                .append(endTime, dateRange.endTime)
                .isEquals();
    }

    @Override
    public int hashCode() {
        return new org.apache.commons.lang3.builder.HashCodeBuilder(17, 37)
                .append(startTime)
                .append(endTime)
                .toHashCode();
    }

    @Override
    public String toString() {
        return new org.apache.commons.lang3.builder.ToStringBuilder(this)
                .append("startTime", startTime)
                .append("endTime", endTime)
                .toString();
    }
}