im = "Users/claudiodonaggio/desktop/Gio/Buffers/nx/"
sn = "Users/claudiodonaggio/desktop/Gio/Buffers/sx/"
mi = "Users/claudiodonaggio/desktop/Gio/Buffers/mk/"
me = "Users/claudiodonaggio/desktop/Gio/Buffers/ux/"
ma = "Users/claudiodonaggio/desktop/Gio/Buffers/tok/"
bb = "Users/claudiodonaggio/desktop/Gio/Buffers/kk/"
kt1 = "Users/claudiodonaggio/desktop/Gio/Buffers/kit1/"
kt2 = "Users/claudiodonaggio/desktop/Gio/Buffers/kit2/"
vv =  "Users/claudiodonaggio/desktop/Gio/Buffers/ven/"
hh =  "Users/claudiodonaggio/desktop/Gio/Buffers/hh/"
tb =  "Users/claudiodonaggio/desktop/Gio/Buffers/tabla/"
jn =  "Users/claudiodonaggio/desktop/Gio/Buffers/John/"
gl = "Users/claudiodonaggio/desktop/Gio/Buffers/glitch/"
tr = "Users/claudiodonaggio/desktop/Gio/Buffers/tryh/"
bt = "Users/claudiodonaggio/desktop/Gio/Buffers/bit/"
ms = "Users/claudiodonaggio/desktop/Gio/Buffers/mus/"
######constructor for ddr,ddr1,ddr2,ddr3,rum,rum2
define :kl do|a,b,c,d,f,g,h|
  with_fx :lpf, cutoff: rrand_i(a,b) do
    
    sample c.choose, rand_i(d) , amp: f.choose, rate: g.choose
    sleep h.choose
    
  end
end


######constructor for ddr,ddr1,ddr2,ddr3,rum,rum2
define :kl1 do|a,b,c,d,f,g,h|
  
  with_fx :lpf, cutoff: rrand_i(a,b) do
    
    sample c.choose, rand_i(d) , amp: f.choose, rate: g.choose
    if a < 70
      sleep 0.25
    else
      sleep h.choose
    end
    
  end
  
end

#kl1 senza random sample
define :klnr do|a,b,c,d,f,g,h |
  
  with_fx :lpf, cutoff: rrand_i(a,b) do
    
    sample c.choose, d , amp: f.choose, rate: g.choose
    if a < 70
      sleep 0.25
    else
      sleep h.choose
    end
    
  end
  
end

#drum1
define :ddr do|a,b|
  a.times do
    kl1 b, 110,
      [im, kt1], 4,
      [0.4, 0.6, 0.8],
      [0.3, 0.8, 0.6],
      [1, 0.5]
  end
end
#drum2
define :ddr1 do|a,b, c|
  a.times do
    kl1 b, 110,
      c, 4,
      [0.4, 0.6, 0.8],
      [0.3, 0.8, 0.6],
      [1, 0.5]
  end
end
#drum3
define :ddr2 do|a,b|
  a.times do
    kl1 b, 110,
      [me, bb], 4,
      [0.4, 0.6, 0.8],
      [1.3, 1.8, 1.6],
      [1, 0.5]
  end
end
#drum4
define :ddr3 do|a,b|
  a.times do
    kl1 b, 110,
      [kt2], 9,
      [0.4, 0.6, 0.8],
      [0.3, 0.8, 0.6],
      [1, 0.5]
  end
end
#####bassy-drumsy1
define :rum do |a, b|
  a.times do
    kl1 b, 110,
      [ma, ni], 12,
      [0.6, 0.8, 0.4],
      [0.3, 0.4, 0.6],
      [2, 1]
  end
end
#bassy-drumsy2
define :rum2 do |a, b|
  with_fx :flanger do
    a.times do
      klnr b, 110,
        [gl], 2,
        [0.6, 0.8, 0.4],
        [0.3, 0.4, 0.6],
        [2, 1]
    end
  end
end

#my bassdrum: takes a cutoff param, an amp param (as an array) a sleep val(as an array)
define :bdc do|x,y,z|
  sample :bd_haus, cutoff: x, amp: y.choose
  sleep z.choose
end

### stt takes a samp folder, samp num, a beatstretsch(also a sleep value) and an amp.
define :stt do|sa, num, b, am|
  sample sa, num, beat_stretch: b, amp: am
  sleep  b
end

define :evn do|samp, nam|
  q = rrand_i(0.25, 2)
  sample samp, nam, beat_stretch: q+0.5, rpitch: q - 4
end
####ringmod drum1
define :enm do |a, b|
  with_fx :ring_mod, freq: rrand_i(12,40) do
    a.times do
      kl1  b, 110,
        [im, bb], rand_i(12),
        [0.6, 0.8, 0.4],
        [0.3, 0.4, 0.6],
        [2, 1]
    end
  end
end
####ringmod drum2
define :enm1 do|a,b|
  with_fx :ring_mod, freq: rrand_i(12,50) do
    a.times do
      
      kl1  b, 110,
        [kt1, kt2], rand_i(12),
        [0.6, 0.8, 0.4],
        [0.3, 0.4, 0.6],
        [2, 1]
    end
  end
end
####ringmod glitch
define :glt1 do|a,b|
  with_fx :ring_mod, freq: rrand_i(12,50) do
    a.times do
      
      kl1 b, 110,
        [gl], rand_i(12),
        [0.6, 0.8, 0.4],
        [0.3, 0.4, 0.6],
        [2, 1]
    end
  end
end

###similar to stt but with ringmod and without amp value
### this can be used with sync whereas stt cannot
define :kimm do|sam, nam, bs|
  with_fx :ring_mod, freq: rrand_i(8, 20) do
    sample sam, nam, beat_stretch: bs
    sleep bs
  end
end

#stut
define :stut do |x, w, n, c|
  x.times do
    sample n, w, rate: c, amp: rrand(0.3, 0.8)
    sleep 0.1
  end
end

#stut
define :stut do |x, n,  b, c|
  x.times do
    sample n, b, rate: c, amp: rrand(0.3, 0.8)
    sleep 0.1
  end
end



#midi-stut
define :mstut do |x, n, c|
  x.times do
    midi n, channel: c, velocity: rrand(10, 60)
    sleep 0.1
  end
end

#inian proj

define :tal do |x, y, w, z, d|
  with_fx :bitcrusher, cutoff: 88 do
    density x.tick do
      sample y, w, rate: z, amp: d
      sleep 1
    end
  end
end


define :mtal do |x, y, z, d|
  density x.tick do
    midi y, channel: z, vel: d
    sleep 1
  end
end


define :ren do|a,b,c,d,s|
  density a.tick do
    sample b.choose, c, rate: d
    sleep s
  end
end

define :ren1 do|a,b,c,d,e,f, s|
  with_fx :lpf, cutoff: 80 do
    density a.tick do
      if one_in(8)
        sample b.choose, c, rate: 1.4
        sleep s
      else
        sample b.choose, c, rate: d
        sleep s
      end
      if one_in(8)
        sample e.choose, f, rate: 1.4
        sleep s
      else
        sample e.choose, f, rate: d
        sleep s
      end
    end
    if one_in(16)
      with_fx :ring_mod, freq: rrand_i(8, 110) do
        sample b.choose, c, rate: -0.4
      end
    end
    if one_in (22)
      with_fx :bitcrusher do
        with_fx :autotuner, formant_ratio: rrand(0.8, 3.4) do
          sample e.choose, f, rate: -0.4
        end
      end
    end
  end
end


define :ren2 do|a,b,c,d,e,f,s|
  with_fx :lpf, cutoff: 80 do
    a.times do
      if one_in(8)
        sample b.choose, c, rate: 1.4
        sleep s
      else
        sample b.choose, c, rate: d
        sleep s
      end
      if one_in(8)
        sample e.choose, f, rate: 1.4
        sleep s
      else
        sample e.choose, f, rate: d
        sleep s
      end
    end
    #end
    
    if one_in(16)
      with_fx :ring_mod, freq: rrand_i(8, 110) do
        sample b.choose, c, rate: -0.4
      end
    end
    if one_in (22)
      with_fx :bitcrusher do
        with_fx :autotuner, formant_ratio: rrand(0.8, 3.4) do
          sample e.choose, f, rate: -0.4
        end
      end
      #end
    end
    
  end
end


define :mren do|a,b,c,d,s|
  density a.tick do
    midi b.choose, channel: c, vel: d
    sleep s
  end
end

define :elec do|nt, am, atk, ss|
  with_fx :hpf, cutoff: 80 do
    with_fx :echo, amp: 0.8 do
      synth :fm, cutoff: 80, attack: atk, sustain: ss, note: nt.choose, amp: am
      synth :noise, cutoff: 80, amp: am+0.2, sustain: ss, attack: atk
      synth :dsaw, detune: 0.2, amp: am-0.2, sustain: ss, attack: atk, note: nt.choose
    end
  end
end

define :pro do|sm, n, sm1, n1|
  with_fx :lpf do
    sample sm, n, cutoff: 60
    sleep 2
    if one_in(8)
      sample sm1, n1
      sleep 1
      sample sm1, n1
      sleep 1
    else
      if one_in(32)
        stut 8, sm1 , n1, -1
        sleep 1
      else
        
        sample sm1, n1
        sleep 2
      end
    end
  end
end

define :tre do |sm, n, sm1, n1|
  with_fx :lpf do
    sample sm, n, cutoff: 60
    sleep 2
    if one_in(8)
      sample sm1, n1
      sleep 0.5
      sample sm1, n1
      sleep 1.5
    else
      if one_in(32)
        with_fx :flanger do
          stut 8, sm1 , n1, -1
          sleep 1
        end
        
      else
        
        sample sm1, n1
        sleep 2
      end
    end
  end
end
