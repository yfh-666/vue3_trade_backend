package com.xiaobaitiao.springbootinit.manager.constant;

/**
 * SparkApiVersion
 *
 * @author briqt
 * @date 2023/8/31
 */
public enum SparkApiVersion {

    /**
     * 1.5版本
     */
    V1_5("v1.1", "https://spark-api.xf-yun.com/v1.1/chat", "general"),

    /**
     * 2.0版本
     */
    V2_0("v2", "https://spark-api-open.xf-yun.com/v2/chat", "x1"),

    /**
     * 3.5版本
     */
    V3_0("v4.0", "https://spark-api.xf-yun.com/v4.0/chat", "4.0Ultra"),
    ;

    SparkApiVersion(String version, String url, String domain) {
        this.version = version;
        this.url = url;
        this.domain = domain;
    }

    private final String version;

    private final String url;

    private final String domain;

    public String getVersion() {
        return version;
    }

    public String getUrl() {
        return url;
    }

    public String getDomain() {
        return domain;
    }
}
