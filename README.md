# CmpText

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cmp_text`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cmp_text'
```

And then execute:

    $ bundle

Or install it yourself as:

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
        [0] "武汉",
        [1] "中国"
    ]
  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cmp_text. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the CmpText project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cmp_text/blob/master/CODE_OF_CONDUCT.md).
