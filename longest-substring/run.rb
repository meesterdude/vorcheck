#!/bin/ruby

# detects the longest repeating, non overlapping substring of any given string
# this method works as follows:
# 1. iterates over each character and detects if more than two exist
# 2. of those, check the character again along with the following character for more than 2.
#    if there are not more than two, or the length is less than what we'd expect, remove it from consideration
# 3. repeat step 2 for the remaining character positions, increasing the number of following characters until we run out
# 4. whichever was our last detected is the longest repeating substring
def repeating_substring(string)
  max = string.length
  additional = 1
  positions = []
  last = nil
  string.chars.each_with_index{|c,i| positions << i if (string.scan(c).size >= 2)}
  return "nothing repeats" if positions.empty?
  until positions.count < 2
    progress_string = string.chars
    positions.each do |pos|
      pos_end = pos + additional
      substr = string[pos..pos_end]
      if (substr.length != additional + 1)
        positions.delete(pos)
        next
      end
      string.scan(substr).size >= 2 ? last = substr : positions.delete(pos)
    end
    additional += 1
  end
  last
end


constitution = %Q{

We the People of the United States, in Order to form a more perfect Union, establish Justice, insure domestic Tranquility, provide for the common defence, promote the general Welfare, and secure the Blessings of Liberty to ourselves and our Posterity, do ordain and establish this Constitution for the United States of America.

Article I (Article 1 - Legislative)
Section 1
All legislative Powers herein granted shall be vested in a Congress of the United States, which shall consist of a Senate and House of Representatives.

Section 2
1: The House of Representatives shall be composed of Members chosen every second Year by the People of the several States, and the Electors in each State shall have the Qualifications requisite for Electors of the most numerous Branch of the State Legislature.

2: No Person shall be a Representative who shall not have attained to the Age of twenty five Years, and been seven Years a Citizen of the United States, and who shall not, when elected, be an Inhabitant of that State in which he shall be chosen.

3: Representatives and direct Taxes shall be apportioned among the several States which may be included within this Union, according to their respective Numbers, which shall be determined by adding to the whole Number of free Persons, including those bound to Service for a Term of Years, and excluding Indians not taxed, three fifths of all other Persons.2  The actual Enumeration shall be made within three Years after the first Meeting of the Congress of the United States, and within every subsequent Term of ten Years, in such Manner as they shall by Law direct. The Number of Representatives shall not exceed one for every thirty Thousand, but each State shall have at Least one Representative; and until such enumeration shall be made, the State of New Hampshire shall be entitled to chuse three, Massachusetts eight, Rhode-Island and Providence Plantations one, Connecticut five, New-York six, New Jersey four, Pennsylvania eight, Delaware one, Maryland six, Virginia ten, North Carolina five, South Carolina five, and Georgia three.

4: When vacancies happen in the Representation from any State, the Executive Authority thereof shall issue Writs of Election to fill such Vacancies.

5: The House of Representatives shall chuse their Speaker and other Officers; and shall have the sole Power of Impeachment.

Section 3
1: The Senate of the United States shall be composed of two Senators from each State, chosen by the Legislature thereof,3 for six Years; and each Senator shall have one Vote.

2: Immediately after they shall be assembled in Consequence of the first Election, they shall be divided as equally as may be into three Classes. The Seats of the Senators of the first Class shall be vacated at the Expiration of the second Year, of the second Class at the Expiration of the fourth Year, and of the third Class at the Expiration of the sixth Year, so that one third may be chosen every second Year; and if Vacancies happen by Resignation, or otherwise, during the Recess of the Legislature of any State, the Executive thereof may make temporary Appointments until the next Meeting of the Legislature, which shall then fill such Vacancies.4

3: No Person shall be a Senator who shall not have attained to the Age of thirty Years, and been nine Years a Citizen of the United States, and who shall not, when elected, be an Inhabitant of that State for which he shall be chosen.

4: The Vice President of the United States shall be President of the Senate, but shall have no Vote, unless they be equally divided.

5: The Senate shall chuse their other Officers, and also a President pro tempore, in the Absence of the Vice President, or when he shall exercise the Office of President of the United States.

6: The Senate shall have the sole Power to try all Impeachments. When sitting for that Purpose, they shall be on Oath or Affirmation. When the President of the United States is tried, the Chief Justice shall preside: And no Person shall be convicted without the Concurrence of two thirds of the Members present.

7: Judgment in Cases of impeachment shall not extend further than to removal from Office, and disqualification to hold and enjoy any Office of honor, Trust or Profit under the United States: but the Party convicted shall nevertheless be liable and subject to Indictment, Trial, Judgment and Punishment, according to Law.


}

['ababab', "a rose is but a rosey", "drink ovaltine ovaltine is great for kids and ovaltine is great tasting too drink ovaltine", constitution].each do |example|
  puts repeating_substring(example)
end
