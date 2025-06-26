package com.xiaobaitiao.springbootinit.manager;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.xiaobaitiao.springbootinit.config.CosClientConfig;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.File;

@Component
public class CosManager {

    @Resource
    private CosClientConfig cosClientConfig;

    @Resource
    private COSClient cosClient;

    /**
     * 默认上传（无 content-type）
     */
    public PutObjectResult putObject(String key, File file) {
        PutObjectRequest request = new PutObjectRequest(cosClientConfig.getBucket(), key, file);
        return cosClient.putObject(request);
    }

    /**
     * 带 Content-Type 上传（推荐）
     */
    public PutObjectResult putObject(String key, File file, String contentType) {
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentType(contentType);

        PutObjectRequest request = new PutObjectRequest(cosClientConfig.getBucket(), key, file);
        request.setMetadata(metadata);

        return cosClient.putObject(request);
    }

    /**
     * 支持通过文件路径上传（可选）
     */
    public PutObjectResult putObject(String key, String localFilePath) {
        return this.putObject(key, new File(localFilePath));
    }
}
