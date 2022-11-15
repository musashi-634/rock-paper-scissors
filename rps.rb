class Rock_paper_scissors
  @@rps_choice_hash = {
    "1": "グー",
    "2": "チョキ",
    "3": "パー",
    "0": "戦わない"
  }
  
  def initialize
    @player_choices = ["", ""]
    @cpu_choices = ["1", ""]
    
    play_rock_paper_scissors
  end
  
  def play_rock_paper_scissors
    win_rps_player = nil # プレイヤーのじゃんけんの勝敗を表すbool値
    
    puts "「じゃんけん...」"
    puts "選択-> "\
         "1（#{@@rps_choice_hash[:"1"]}） "\
         "2（#{@@rps_choice_hash[:"2"]}） "\
         "3（#{@@rps_choice_hash[:"3"]}） "\
         "0（#{@@rps_choice_hash[:"0"]}）"
    @player_choices[0] = gets.chomp
    if @player_choices[0] == @@rps_choice_hash.key("戦わない").to_s
      puts "対戦を終了します"
      exit
    end
    puts "「ホイ！」"
    show_choice
    if @player_choices[0] == @cpu_choices[0]
      is_even = true  # あいこの判定
      while is_even
        puts "「あいこで...」"
        puts "選択-> "\
             "1（#{@@rps_choice_hash[:"1"]}） "\
             "2（#{@@rps_choice_hash[:"2"]}） "\
             "3（#{@@rps_choice_hash[:"3"]}） "\
             "0（#{@@rps_choice_hash[:"0"]}）"
        @player_choices[0] = gets.chomp
        if @player_choices[0] == @@rps_choice_hash.key("戦わない").to_s
          puts "対戦を終了します"
          exit
        end
        puts "「ショ！」"
        show_choice
        if @player_choices[0] != @cpu_choices[0]
          is_even = false
        end
      end
    end
    
    # じゃんけんの勝敗の判定
    case @player_choices[0]
    when @@rps_choice_hash.key("グー").to_s
      if @cpu_choices[0] == @@rps_choice_hash.key("チョキ").to_s
        win_rps_player = true
      else
        win_rps_player = false
      end
    when @@rps_choice_hash.key("チョキ").to_s
      if @cpu_choices[0] == @@rps_choice_hash.key("パー").to_s
        win_rps_player = true
      else
        win_rps_player = false
      end
    when @@rps_choice_hash.key("パー").to_s
      if @cpu_choices[0] == @@rps_choice_hash.key("グー").to_s
        win_rps_player = true
      else
        win_rps_player = false
      end
    end
    
    if win_rps_player
      puts "じゃんけんに勝利しました"
    elsif win_rps_player == false
      puts "じゃんけんに敗北しました"
    else
      puts "じゃんけんの勝敗が不明です"
    end
    # play_look_this_way
  end
  
  def show_choice
    if @player_choices[1] == ""
      puts "----------------------------------"
      puts "あなた：#{@@rps_choice_hash[@player_choices[0].to_sym]}を出しました"
      puts "相手：#{@@rps_choice_hash[@cpu_choices[0].to_sym]}を出しました"
      puts "----------------------------------"
    else
      
    end
  end
  
  def play_look_this_way
    puts "あっち向いて〜"
  end
end

# -------------------------------------------------------------------------
# main
# -------------------------------------------------------------------------
Rock_paper_scissors.new