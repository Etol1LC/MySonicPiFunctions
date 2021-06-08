######constructor for drm
define :kl do|a,b,c,d,f,g,h|
  with_fx :lpf, cutoff: rrand_i(a,b) do
    
    sample c.choose, rand_i(d) , amp: f.choose, rate: g.choose
    sleep h.choose
    
  end
end


######constructor for drm
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

define :kimm do|sam, nam, bs|
  with_fx :ring_mod, freq: rrand_i(8, 20) do
    sample sam, nam, beat_stretch: bs
    sleep bs
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


define :elec do|nt, am, atk, ss|
  with_fx :hpf, cutoff: 80 do
    with_fx :echo, amp: 0.8 do
      synth :fm, cutoff: 80, attack: atk, sustain: ss, note: nt.choose, amp: am
      synth :noise, cutoff: 80, amp: am+0.2, sustain: ss, attack: atk
      synth :dsaw, detune: 0.2, amp: am-0.2, sustain: ss, attack: atk, note: nt.choose
    end
  end
end


define :drm do|a,b,c|
  a.times do
    kl1 b, 110,
      [c], 4,
      [0.4, 0.6, 0.8],
      [0.3, 0.8, 0.6],
      [1, 0.5]
  end
end























