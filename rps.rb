class Rock_paper_scissors
  @@rps_choice_hash = {
    "1": "グー",
    "2": "チョキ",
    "3": "パー",
    "q": "戦わない"
  }
  @@look_this_way_choice_hash = {
    "1": "上",
    "2": "下",
    "3": "左",
    "4": "右"
  }
  
  def initialize
    play_rock_paper_scissors
  end
  
  def play_rock_paper_scissors
    @player_choices = ["", ""]
    @cpu_choices = ["1", "1"]
    @win_rps_player = nil # プレイヤーのじゃんけんの勝敗を表すbool値
    
    puts "「じゃんけん...」"
    show_selectable_choice(@@rps_choice_hash)
    get_choice("rock_paper_scissors")
    puts "「ポン！」"
    show_decided_choice
    
    # あいこの場合の処理
    if @player_choices[0] == @cpu_choices[0]
      is_even = true  # あいこの判定
      while is_even
        puts "「あいこで...」"
        show_selectable_choice(@@rps_choice_hash)
        get_choice("rock_paper_scissors")
        puts "「ショ！」"
        show_decided_choice
        if @player_choices[0] != @cpu_choices[0]  # あいこでない場合
          is_even = false
        end
      end
    end
    
    # じゃんけんの勝敗の判定
    case @player_choices[0]
    when @@rps_choice_hash.key("グー").to_s
      if @cpu_choices[0] == @@rps_choice_hash.key("チョキ").to_s
        @win_rps_player = true
      else
        @win_rps_player = false
      end
    when @@rps_choice_hash.key("チョキ").to_s
      if @cpu_choices[0] == @@rps_choice_hash.key("パー").to_s
        @win_rps_player = true
      else
        @win_rps_player = false
      end
    when @@rps_choice_hash.key("パー").to_s
      if @cpu_choices[0] == @@rps_choice_hash.key("グー").to_s
        @win_rps_player = true
      else
        @win_rps_player = false
      end
    else
      puts "じゃんけんの勝敗が不明です"
      exit
    end
    
    play_look_this_way
  end
  
  def play_look_this_way
    puts "あっち向いて〜"
    show_selectable_choice(@@look_this_way_choice_hash)
    get_choice("look_this_way")
    puts "「ホイ！」"
    show_decided_choice
    
    # あっち向いてホイの勝敗の判定
    if @player_choices[1] == @cpu_choices[1]
      case @win_rps_player
      when true
        puts "あなたの勝ちです"
      else
        puts "あなたの負けです"
      end
    else
      play_rock_paper_scissors
    end
  end
  
  def show_selectable_choice(select_hash)
    output_string = "選択-> "
    select_hash.each{|key, value|
      output_string += "#{key.to_s}（#{value}） "
    }
    puts output_string
  end
  
  def get_choice(game_name)
    case game_name
    when "rock_paper_scissors"
      @player_choices[0] = gets.chomp
      if @@rps_choice_hash.key?(@player_choices[0].to_sym) == false # 入力不正チェック
        puts "入力が間違っています"
        exit
      end
      if @player_choices[0] == @@rps_choice_hash.key("戦わない").to_s # やめる場合
        puts "対戦を終了します"
        exit
      end
    when "look_this_way"
      @player_choices[1] = gets.chomp
      if @@look_this_way_choice_hash.key?(@player_choices[1].to_sym) == false # 入力不正チェック
        puts "入力が間違っています"
        exit
      end
    else
      puts "引数のゲーム名が間違っています"
      exit
    end
  end
  
  def show_decided_choice
    if @player_choices[1] == ""
      puts "----------------------------------"
      puts "あなた：#{@@rps_choice_hash[@player_choices[0].to_sym]}"
      puts "相手：#{@@rps_choice_hash[@cpu_choices[0].to_sym]}"
      puts "----------------------------------"
    else
      puts "----------------------------------"
      puts "あなた：#{@@look_this_way_choice_hash[@player_choices[1].to_sym]}"
      puts "相手：#{@@look_this_way_choice_hash[@cpu_choices[1].to_sym]}"
      puts "----------------------------------"
    end
  end
end

# -------------------------------------------------------------------------
# main
# -------------------------------------------------------------------------
Rock_paper_scissors.new