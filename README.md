# CmpText


## Installation

添加这行代码到你的 Gemfile:

```ruby
gem 'cmp_text'
```

然后执行:

    $ bundle

或者直接安装:

    $ gem install cmp_text

## Usage

你可以填写两个参数,参数可以是文件,也可以是字符串:

```ruby
  CmpText::Analysis.txt_cmp(file_1, file_2)
```
或者:

```ruby
  CmpText::Analysis.txt_cmp(str_1, str_2)
```

## Example

例如直接输入两个字符串:

```ruby
  CmpText::Analysis.txt_cmp('我来自武汉','我来自中国') # => 0.6
```

或者用print方法打印出更加JSON结果,succ_char成功比对的部分,failed_char比对失败的部分:

```ruby
CmpText::Analysis.print('我来自武汉','我来自中国')
```

结果:
```ruby
{
  :result => "匹配度是 60.0%",
  :data => {
    :or_text_1 => "我来自武汉",
    :or_text_2 => "我来自中国",
    :succ_char => [
      [0] "我来自"
    ],
    :failed_char => [
      [0] "中国",
      [1] "武汉"
    ]
  }
}
```
