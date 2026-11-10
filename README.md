# dsh-superagent-lab

DeepSeek Harness Superagent 的专用测试仓库。只用于验证「GitHub 事件 → 自动建工单 → 独立会话执行 → 测试 → PR」的闭环，不存放任何业务数据、客户资料或密钥。

- `tools/greet.sh`：极小的样例脚本，工单通常修改这里的一句文案
- `tests/test_greet.sh`：冒烟测试，CI 会跑
