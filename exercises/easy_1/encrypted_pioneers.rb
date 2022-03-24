=begin 

The following list contains the names of individuals who are pioneers in the 
field of computing or that have had a significant influence on the field. The
 names are in an encrypted form, though, using a simple (and incredibly weak) 
 form of encryption called Rot13

 Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names

input: a file of encrypted names (each name on different line)
output: names printed to screen, deciphered

Rules: 
- Use ROT13 cipher in which to  encrypt a string, each string is rotated 13 places
forward in the alphabet and replaced with that char. 
- 

=end

LOWERCASE_LETTERS  = ('a'..'z').to_a
UPPERCASE_LETTERS = ('A'..'Z').to_a
ENCRYPTED_NAMES = File.open('encrypted_pioneers.txt')

def create_rot13_map(range_arr)
  range_arr.to_h do |member|
    member_ahead_13_places = range_arr.rotate(range_arr.index(member) + 13).first
    [member, member_ahead_13_places]
  end
end

def decode_rot13_file(file)
  rot_13_map = create_rot13_map(LOWERCASE_LETTERS).merge(create_rot13_map(UPPERCASE_LETTERS))
  output =  file.readlines.map do |name|
    name.chars.map { |char| rot_13_map.key?(char) ? rot_13_map[char] : char }.join
  end
  puts output
end

decode_rot13_file(ENCRYPTED_NAMES)


