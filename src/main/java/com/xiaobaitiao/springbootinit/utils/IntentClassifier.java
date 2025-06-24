package com.xiaobaitiao.springbootinit.utils;


import java.util.Arrays;
import java.util.List;

    public class IntentClassifier {

        public enum Intent {
            PRODUCT_RECOMMENDATION,
            CUSTOMER_SERVICE,
            ORDER_CANCEL,
            CASUAL_CHAT,
            GENERAL_QUESTION
        }

        public static Intent classify(String userInput) {
            userInput = userInput.toLowerCase().trim();

            List<String> recommendKeywords = Arrays.asList("推荐", "买", "购买", "适合", "选", "挑");
            List<String> productKeywords = Arrays.asList("商品", "电脑", "手机", "书", "商品信息");

            if (containsAny(userInput, recommendKeywords) && containsAny(userInput, productKeywords)) {
                return Intent.PRODUCT_RECOMMENDATION;
            }

            List<String> serviceKeywords = Arrays.asList("客服", "人工", "联系", "投诉");
            if (containsAny(userInput, serviceKeywords)) {
                return Intent.CUSTOMER_SERVICE;
            }

            List<String> cancelKeywords = Arrays.asList("取消订单", "不要了", "退货");
            if (containsAny(userInput, cancelKeywords)) {
                return Intent.ORDER_CANCEL;
            }

            List<String> chatKeywords = Arrays.asList("你好", "你是谁", "聊天", "笑话");
            if (containsAny(userInput, chatKeywords)) {
                return Intent.CASUAL_CHAT;
            }

            return Intent.GENERAL_QUESTION;
        }

        private static boolean containsAny(String text, List<String> keywords) {
            return keywords.stream().anyMatch(text::contains);
        }
    }


