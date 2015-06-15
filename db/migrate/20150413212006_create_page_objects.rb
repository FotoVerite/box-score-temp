class CreatePageObjects < ActiveRecord::Migration
  def up
    Page.create(title: 'Frequently Asked Questions', slug: 'faq', content: "## What is HS Box Scores NYC?\r\n\r\nHS Box Scores NYC, LLC is the owner and operator of [www.hsboxscoresnyc.com](www.hsboxscoresnyc.com),\r\na new website dedicated to the display of NYC varsity basketball, baseball and softball box scores.\r\n\r\n## How does it work?\r\n\r\nVarsity team coaches who register their teams can enter box scores after each game using our\r\npassword-protected user-friendly data entry process. For added convenience, coaches may send us a\r\ncopy of the official scorebook or other stat sheet by fax at (212) 330-7659 or by email to\r\n[info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com) and we will enter the box score on the coach's behalf.\r\n\r\n## How much does it cost to register?\r\n\r\nIt's free for all NYC varsity basketball, baseball and softball teams.\r\n\r\n## Who can participate?\r\n\r\nAny NYC varsity basketball, baseball or softball team (boys and girls – public and private – large and small).\r\n\r\n## How does a coach register?\r\n\r\nBy (i) visiting [www.hsboxscoresnyc.com](www.hsboxscoresnyc.com), (ii) clicking the \"Add Your Team\"\r\nlink/button in the upper right corner of our home page and (iii) entering the basic information in \r\nthe requested fields.\r\n\r\n## Why should a coach register?\r\n\r\nHS Box Scores NYC is seeking to promote interest in varsity basketball, baseball and softball in NYC.\r\nCoaches who register and report their box scores in a timely and consistent manner will give players,\r\nfamily, friends, college recruiters and the media an opportunity to easily monitor and share their team's\r\nresults.\r\n\r\n## How long will it take to enter a box score?\r\n\r\nIf a coach has the official scorebook or other stat sheet in hand, the process should not take long at all.\r\nLike most other tasks, the process is likely to move faster after the coach enters a few box scores and\r\ngets the hang of it. Again, the option of faxing or emailing a copy of the official scorebook or other stat\r\nsheet is always a convenient option.\r\n\r\n## Can a coach report a box score if the opponent is a NYC varsity team that is not registered?\r\n\r\nYes. The coach can still enter the box score for both teams, but without the opposing team's\r\nindividual statistics.\r\n\r\n## Can a coach report a box score if the opponent is not a NYC varsity team?\r\n\r\nYes, but in this case the box score will need to be sent via fax or by email.\r\n\r\n## What do I do if I have a question that is not answered above?\r\n\r\nYou may call us at (212) 330-7681 or email us at [info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com).\r\n\r\n**Participation in our website is optional. We recommend that your carefully review our\r\n[Terms of Service](/terms-of-service) and our [Privacy Policy](/privacy-policy) before you enter any\r\ndata onto our website.**\r\n")

    Page.create(title: 'About Us', slug: 'about', content: "Through this website, HS Box Scores NYC is providing a dedicated platform to display score data and other statistical information for varsity high school basketball, baseball and softball games played in New York City, all at no cost to the schools, student-athletes or website visitors.\r\nThe mission of HS Box Scores NYC is very similar to the mission of Henry Chadwick when he invented the box score in NYC back in the 1860s: to promote interest in the games played.  HS Box Scores NYC will provide each school, coach and student-athlete, as well as friends, family and the media, with an opportunity to track and share the results of NYC varsity basketball, baseball and softball games.  In addition, we expect that widespread participation in this website will boost college recruitment of NYC’s student-athletes competing in these sports.\r\nParticipation in this website is available to all high schools in NYC with varsity teams that compete in basketball, baseball or softball.  We encourage all of these schools (public and private &ndash; large and small) to take advantage of our free service by promptly and consistently reporting score information and the related statistics through our user-friendly password protected data entry tool.\r\nWe hope you enjoy this website and we are excited about the opportunity to expand the focus on varsity high school basketball, baseball and softball in NYC.\r\n\r\n**_HS Box Scores NYC, LLC is an independent company that is not sponsored by or affiliated with any college, high school, AAU program, coaching association or media company._**")

    Page.create(title: 'Privacy Policy', slug: 'privacy_policy', content: "_**Introduction**_\r\n\r\nThis notice describes the privacy policy of HS Box Scores NYC, LLC (\"**HS Box Scores NYC**,\" \"**we**\" or \"**us**\"). Specifically, this privacy policy outlines the types of information that we gather about you in connection with your use of this website and the ways in which we use and share this information.\r\n\r\n**Please read this notice carefully.** By visiting and using the website located at [http://www.hsboxscoresnyc.com](http://www.hsboxscoresnyc.com) (\"**our website**\"), you agree that your use of our website, and any dispute over our online privacy practices, is governed by this notice and our Terms of Service. Because the Internet continues to evolve, we may need to change our privacy policy at some point in the future, in which case we will post a revised notice of the same on our website and update the \"Last Updated\" date to reflect the date of those changes. By continuing to use our website after we post any such changes, you accept the notice of our privacy policy as modified. It is your responsibility to check this notice each time before using our website.\r\n\r\n_**Score Data and Other Statistical Information Displayed on our Website**_\r\n\r\nAs part of the services provided on our website, we will collect and display statistical information about varsity high school sports teams and student-athletes. This is the same type of information that is customarily provided in newspapers and other publications reporting the results of varsity high school basketball, baseball or softball games and it includes the names of the players. This privacy policy does not apply to any such information; **provided, however,** that in the event a player is under the age of thirteen (13), the provisions below under the section entitled \"Children’s Privacy Statement\" will govern such information.\r\n\r\n_**California Residents**_\r\n\r\nCalifornia Code Section 1798.83 permits users of this website who are California residents to request and obtain from us once a year, free of charge, information about the personal information (if any) we disclosed to third parties for direct marketing purposes in the preceding calendar year. If applicable, this information would include a list of the categories of personal information that was shared and the names and addresses of all third parties with which we shared information in the immediately preceding calendar year. If you are a California resident and would like to make such a request, please submit your request in writing to [info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com).\r\n\r\n_**Links to Third Party Websites**_\r\n\r\nOur website may include links to other websites which provide access to products and services offered by third parties. We do not control the privacy policies of such websites and/or third parties. When you access another website or purchase products or services from a third party, the use of any information you provide is governed by the privacy policy of the operator or the website you are visiting or the provider of such products or services.\r\n\r\n_**Collection and Use of Information**_\r\n\r\n_Personally-Identifiable Information of School Administrators_\r\n\r\nIf you are a school administrator, coach or other representative of a school who submits or is authorized to submit score data or other statistical information through our website (a \"**School Administrator**\") we will collect and store personally identifiable information such as your name, telephone number and email address for purposes of maintaining and operating our website. This personally identifiable information will be displayed on the \"Profile Page\" of the school which you represent. As such, this personally identifiable information will be accessible to and may be viewed by the other School Administrators from the same school who submit or are authorized to submit score data or other statistical information through our website. In addition to such access and display, we may use any of this personally identifiable information for any purpose related to our website, including to contact you for customer service purposes, to inform you of important changes or additions to our website or the services offered by our website, and to send you administrative notices and other communications that we believe may be of interest to you. We also may provide any of this personally identifiable information to our third party service providers and contractors for purposes related to website administration and other services. Since this personally identifiable information will only be displayed on the \"Profile Page\" of the school you represent, visitors to our website and School Administrators from other schools are not authorized to view such personally identifiable information. However, as set forth in our Terms of Service, although we will take reasonable steps to safeguard and prevent unauthorized access to such personally identifiable information, we cannot and will not be responsible for the acts of those who gain unauthorized access to such personally identifiable information.\r\n\r\nIf you do not wish to have any of your personally identifiable information to be collected, displayed or shared for any of the purposes described above, please submit a specific exclusion request via email to [info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com). Please note that any such exclusion request may result in the suspension or termination of your ability to submit score data and other statistical information through this website.\r\n\r\n_Non-Personally Identifiable Information of Website Visitors_\r\n\r\nWe may also collect and store non-personally identifiable information that is generated automatically as you navigate through this website. For example, we may collect information about your computer’s connection to the Internet, which allows us to measure traffic on our website. We may also use a standard feature found in browser software called a \"cookie.\" Cookies are small amounts of data that are stored in separate files within your computer’s Internet browser. Cookies are accessed and recorded by the websites you visit, and by the companies that show advertisements on websites so they can recognize the same browsers navigating online. By showing how and when visitors use our website, cookies may help us deliver advertisements, identify how many unique users visit our website, and track user trends and patterns. Our website may also use web beacons (sometimes called transparent GIFs, clear GIFs or web bugs) to access cookies and to count users who visit our website. You have the choice to set your browser to accept all cookies, reject all cookies, notify you when a cookie is set, and to delete your cookies periodically. Each browser is different, so check the \"Help\" menu of your browser to learn how to change your cookies preferences.\r\n\r\nThe non-personally identifiable information we collect may be collected directly by us or it may be collected by a third-party website hosting provider, or another third-party service provider, on our behalf. We may use the information collected from you while you are using this website in a variety of ways, including to customize advertising that appears on our website, measure traffic to our website and measure user interests and traffic patterns.\r\n\r\n_**Children’s Privacy Statement**_\r\n\r\nOur website is not directed to children under the age of thirteen (13) and we do not knowingly collect personally identifiable information from children under the age of thirteen (13). We take precautions to prevent School Administrators from providing personally identifiable information of children under the age of thirteen (13). If we become aware that we have inadvertently received personally identifiable information of a child under the age of thirteen (13) as part of the services provided by this website, we will delete such information from our records forthwith.\r\n\r\n_**Release of Information in Certain Circumstances**_\r\n\r\nPlease be aware that we may release information about visitors to and users of our website if required to do so by law or if, in our business judgment, such disclosure is reasonably necessary: (a) to comply with legal process; (b) to enforce our Terms of Service; or (c) to protect the rights of HS Box Scores NYC, its managers, members, employees, agents, representatives or users who comply with our Terms of Service.\r\n\r\nIn addition, we may share or transfer personally identifiable information about School Administrators and non-personally identifiable information about our visitors in connection with a substantial corporate transaction, such as a merger, consolidation, asset sale or in connection with a bankruptcy proceeding.\r\n\r\n_**Storage of Information**_\r\n\r\nAll information on our website is stored within a database to which only we and our hosting services provider are provided access. Although we have implemented security measures that we believe provide adequate protection, no physical or electronic security system is 100% protective and we cannot guarantee the security of our website’s servers or databases, nor can we guarantee that information you supply will not be intercepted while being transmitted over the Internet.")

    Page.create(title: 'Contact Us', slug: 'contact', content: "##By Regular Mail\r\nHS Box Scores NYC, LLC 1133<br>\r\nBroadway, Suite 708<br>\r\nNew York, NY 10010<br>\r\n##By Email\r\n<info@hsboxscoresnyc.com>\r\n##By Phone\r\n(212)-330-7681\r\n##By Fax\r\n(212)-330-7659")

    Page.create(title: 'Terms of Service', slug: 'terms_of_service', content: "**Read Carefully**\r\n\r\nThese Terms of Service apply to the use of the website located at [http://www.hsboxscoresnyc.com](http://www.hsboxscoresnyc.com) (\"**this website**\") and the services provided on or through this website. This website and such services are the property of HS Box Scores NYC, LLC (\"**HS Box Scores NYC**\" \"**we**\" or \"**us**\"). By using this website, you agree to these Terms of Service and to use this website in accordance with these Terms of Service, our [Privacy Policy](/privacy-policy), and any additional terms or conditions that are referenced herein or that otherwise may apply to specific sections of this website or the services that we make available through this website, all of which are deemed part of these Terms of Service.\r\n\r\nWe may change these Terms of Service or impose new conditions on the use of this website from time to time in our sole discretion. In that event, we will post the revised Terms of Service on this website and change the \"**Last Updated**\" date to reflect the effective date of such changes. By using this website after we post any such changes, you accept the Terms of Service as so modified. It is your responsibility to check these Terms of Service each time before using this website.\r\n\r\n**Limited Right of Use**\r\n\r\nThis website and all of the materials available on this website (including, without limitation, all text, images, graphics, logos and other content) are the property of HS Box Scores NYC and are protected by copyright, trademark and other intellectual property laws. This website is provided solely for informational noncommercial use and is not intended for any other use. Use of this website for purposes of competitive intelligence is strictly prohibited and a violation of these Terms of Service. You may not modify, reverse-engineer, decompile, disassemble or otherwise reduce or attempt to reduce to a human-perceivable form any of the source code used by this website.\r\n\r\nYou may not use this website or any materials or services made available on this website in any manner that constitutes an infringement of our rights or that has not been authorized by us. Except as expressly authorized in these Terms of Service, you may not copy, reproduce, republish, upload, post, transmit or distribute in any manner or medium (electronically or otherwise) any materials from this website. You may, however, forward box scores and other statistical data displayed on this website in the manner provided for on this website, provided that you keep intact all copyright, trademark and other proprietary notices. For information about requesting permission to otherwise reproduce or distribute materials from this website, please contact us at (212)-330-7681 or [info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com).\r\n\r\nWe may deny access to this website or any of its features to anyone who we determine infringes on the rights of HS Box Scores NYC or any other party or who otherwise violates these Terms of Service.\r\n\r\n**Limitations on Linking and Framing**\r\n\r\nYou may establish a hypertext link to our website so long as the link does not state or imply that HS Box Scores NYC sponsors or otherwise supports the site where such link is established. However, you may not, without our prior written consent, frame or inline link any of the content of this website, or incorporate into another website or other service any of our material, content or intellectual property.\r\n\r\n**Modifications or Discontinuation**\r\n\r\nWe reserve the right to modify, suspend or discontinue this website, or any portion hereof, with or without notice. You agree that neither HS Box Scores NYC nor any of its officers, managers, members, employees, agents, representatives, contractors, service providers or licensors (its, \"**Associated Persons**\") will be liable to you or to any third party for any modification, suspension or discontinuation of this website or any portion hereof.\r\n\r\n**Disclaimers**\r\n\r\nThe box scores, statistical data and other material included on this website are based upon information provided by school administrators who submit such data to this website. While we encourage the school administrators to submit only accurate information as promptly as practicable, we cannot guarantee the accuracy of such information or the timeliness of the display of such information (or that any school administrator will submit any score or statistical information at all) and we make no representations, warranties or assurances regarding any of the foregoing. You acknowledge and agree that you must bear any risk associated with the use of any content contained on this website, including any reliance on the accuracy of such content, any delay associated with the display of such information or any absence of the same.\r\n\r\nTHE INFORMATION AND SERVICES OFFERED ON OR THROUGH THIS WEBSITE ARE PROVIDED \"**AS-IS**\" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR IMPLIED. TO THE FULLEST EXTENT PERMITTED PURSUANT TO APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED. WE DO NOT WARRANT THAT THIS WEBSITE OR ANY OF ITS FUNCTIONS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT ANY DEFECTS WILL BE CORRECTED, OR THAT ANY PART OF THIS WEBSITE OR THE SERVERS THAT MAKE IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS.\r\n\r\nWE DO NOT MAKE ANY REPRESENTATIONS OR WARRANTIES REGARDING THE USE OR THE RESULTS OF THE USE OF THIS WEBSITE OR THE MATERIALS CONTAINED ON THIS WEBSITE IN TERMS OF THEIR CORRECTNESS, ACCURACY, TIMELINESS, RELIABILITY (INCLUDING PARTICIPATION BY ONE OR MORE SCHOOLS) OR OTHERWISE.\r\n\r\nYou must provide and are solely responsible for all hardware and/or software necessary to access this website. You assume the entire cost of and responsibility for any damage to, and all necessary maintenance, repair or correction of, that hardware and/or software.\r\n\r\n**Limitation of Liability**\r\n\r\nTHE ENTIRE RISK ARISING OUT OF THE USE OF THIS WEBSITE, INCLUDING ITS MATERIALS AND SERVICES, OR ANY MATERIALS OR SERVICES MADE AVAILABLE THROUGH THIS WEBSITE BY THIRD PARTIES, AND/OR THE USE OF ANY CONTENT INCLUDED IN ANY OF THE FOREGOING, REMAINS WITH YOU. UNDER NO CIRCUMSTANCES WILL HS BOX SCORES NYC OR ANY OF ITS ASSOCIATED PERSONS BE LIABLE FOR ANY DAMAGES WHATSOEVER, INCLUDING, BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES, DAMAGES FOR LOSS OF BUSINESS PROFITS, DAMAGES FOR BUSINESS INTERRUPTION, DAMAGES FOR LOSS OF BUSINESS INFORMATION OR DAMAGES FOR ANY OTHER PECUNIARY LOSS THAT RESULT FROM THE USE OF, OR THE INABILITY TO USE, THIS WEBSITE, INCLUDING ITS MATERIALS OR SERVICES, OR ANY MATERIALS OR SERVICES MADE AVAILABLE THROUGH THIS WEBSITE BY US OR BY THIRD PARTIES, IN EACH CASE REGARDLESS OF WHETHER SUCH DAMAGES ARE SOUGHT IN A CLAIM BASED IN CONTRACT, TORT, STRICT LIABILITY, NEGLIGENCE OR ANY OTHER THEORY OF LIABILITY AND EVEN IF HS BOX SCORES NYC OR ITS ASSOCIATED PERSONS HAVE ACTUAL OR CONSTRUCTIVE KNOWLEDGE OF THE POSSIBILITY OF SUCH DAMAGES.\r\n\r\nYOU AGREE THAT IF THERE IS A DISPUTE BETWEEN USERS OF THIS WEBSITE (INCLUDING, WITHOUT LIMITATION, ADMINISTRATORS FROM DIFFERENT SCHOOLS, COACHES AND/OR PLAYERS), OR BETWEEN A USER AND ANY THIRD PARTY, NEITHER HS BOX SCORES NYC NOR ANY OF ITS ASSOCIATED PERSONS IS UNDER ANY OBLIGATION TO BECOME INVOLVED, AND YOU HEREBY RELEASE HS BOX SCORES NYC AND EACH OF ITS ASSOCIATED PERSONS FROM ANY CLAIMS, DEMANDS AND DAMAGES OF EVERY KIND AND NATURE, KNOWN OR UNKNOWN, FIXED OR CONTINGENT, DISCLOSED OR UNDISCLOSED, ARISING OUT OF OR IN ANY WAY RELATED TO ANY SUCH DISPUTE.\r\n\r\nYOU ACKNOWLEDGE AND AGREE THAT THE LIMITATIONS OF LIABILITY, DISCLAIMERS OF WARRANTIES AND OTHER LIMITATIONS ON REMEDIES SET FORTH IN THESE TERMS OF SERVICE CONSTITUTE FUNDAMENTAL TERMS OF THE BARGAIN BETWEEN HS BOX SCORES NYC AND YOU.\r\n\r\n**Online Commerce**\r\n\r\nThrough this website, we may provide links and pointers to Internet websites maintained by third parties. Any such linking to a third-party website does not imply an endorsement or sponsorship of such website, or the information, products or services offered on or through such website. In addition, we do not operate or control in any respect any information, products or services that third parties may provide on or through any such website.\r\n\r\nThis website may (now or in the future) offer the ability to purchase one or more products or services offered by third parties. You hereby release us and each of our Associated Persons from any damages that you incur, and you agree not to assert any claim against us or any of our Associated Persons arising from, your purchase or use of any products or services made available by third parties through this website.\r\n\r\nYour interactions with companies, organizations and/or individuals found on or through this website, including any purchases, transactions, or other dealings, and any terms, conditions, representations or warranties associated with such dealings, are solely between you and such companies, organizations and/or individuals. You agree that neither HS Box Scores NYC nor any of its Associated Persons will be responsible or liable for any loss or damage of any sort incurred as a result of any such dealings.\r\n\r\n**Indemnification**\r\n\r\nYou agree to indemnify and hold harmless HS Box Scores NYC and each of its Associated Persons from and against any and all claims, demands, losses, expenses, damages and costs, including reasonable attorneys’ fees, that arise out of or otherwise relate to your use of this website and/or any violation of these Terms of Service by you.\r\n\r\n**Copyright Policy**\r\n\r\nWe take claims of copyright infringement seriously. We will respond to notices of alleged copyright infringement that comply with applicable law. If you believe any materials accessible on or from this website infringe your copyright, you may request removal of those materials (or access thereto) from this website by submitting written notification to us by U.S. Mail to: HS Box Scores NYC, LLC, 1133 Broadway, Suite 708, New York, N.Y. 10010 or by email to: [info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com). After such notification, if infringement is later confirmed by court order or by admission, HS Box Scores NYC will remove the infringing materials. In addition, HS Box Scores NYC may, in its sole discretion, remove the materials at issue prior to that time if HS Box Scores NYC has conclusively confirmed that infringement has occurred. It is the policy of HS Box Scores NYC in appropriate circumstances to disable and/or terminate the access of users who are repeat copyright infringers.\r\n\r\n**Other**\r\n\r\nThese Terms of Service constitute the entire agreement between HS Box Scores NYC and you with respect to the subject matter contained herein and supersede all previous and contemporaneous communications, written or oral. No delay or failure to take action under these Terms of Service shall constitute any waiver by HS Box Scores NYC of any of these Terms of Service. These Terms of Service shall be governed by and construed in accordance with the laws of the State of New York, without giving effect to any principles of conflicts of law.\r\n\r\nThese Terms of Service may not be assigned by you to anyone else. If any provision included in these Terms of Service is found to be unlawful, void or unenforceable for any reason, then such provision shall be deemed severable from these Terms of Service and will not affect the validity and enforceability of the remaining provisions. These Terms of Service are not intended to benefit any third party (except for our Associated Persons), and, except with respect to the Associated Persons as set forth herein, do not create any third party beneficiaries.\r\n\r\n**Additional Terms Applicable to School Administrators**\r\n\r\nIf you are a school administrator, coach or other representative of a school who submits or is authorized to submit score data or statistical information through this website (a \"**School Administrator**\"), the following additional terms are applicable to you as well as the other School Administrators of such school and the school itself. For the avoidance of doubt, the other sections of these Terms of Service remain applicable to, and binding upon, School Administrators and the following terms are in addition to, and not exclusive of, such other provisions.\r\n\r\n_Our Right to Use Information Submitted_\r\n\r\nWhen you submit any data through this website, you acknowledge and agree that:\r\n\r\n1. You have granted to us and anyone authorized by us, a royalty-free, perpetual, irrevocable, non-exclusive unrestricted worldwide license to use, copy, modify, transmit, sell, exploit, create derivative works from, distribute and/or publicly display such data, in whole or in part, in any material or medium (whether now known or hereafter developed), in each case for any purpose that we choose without compensation to you or any team, school or other organization associated with you.\r\n\r\n2. The license referred to in paragraph 1 above includes the right to exploit any proprietary rights in such submission, including, but not limited to, rights under copyright, trademark or patent laws that exist in any relevant jurisdiction.\r\n\r\n_Accuracy of Information Submitted_\r\n\r\nYou agree that any score data or other statistical information submitted through the data entry forms provided by this website will be, to the best of your knowledge, true and accurate. It is your responsibility to evaluate the accuracy of any score data or other statistical information submitted through this website and if we have reasonable grounds to suspect that any information that you have provided is untrue or inaccurate, we have the right to suspend or terminate use by the applicable persons and/or to refuse any and all applicable current or future use of this website (or any portion hereof).\r\n\r\n_Representations and Warranties_\r\n\r\nWith respect to any score or statistical data or other material that you submit through this website (including, without limitation, the names of the players on each team), you represent, warrant and agree with HS Box Scores NYC that: (i) you have obtained all necessary authorizations and consents to submit such data for display on this website (including the use of the name of any individual that is included in such data), (ii) each player who is named or otherwise included in such data is at least thirteen (13) years of age (or older), (iii) the submission of such data does not and will not violate any rule, regulation or policy of any team or school referenced in such data or any association or organization that governs such team or school and (iv) you will indemnify and hold harmless HS Box Scores NYC and each of its Associated Persons from any breach or inaccuracy of any of the foregoing representations, warranties and agreements.\r\n\r\n_Responsibility for Usernames and Passwords_\r\n\r\nTo submit information to this website, you will need to maintain a username and password. You are responsible for maintaining the confidentiality of your password and are responsible for all activities (whether by you or by others) that occur under your username and password. To protect against unauthorized access, be sure to log out when you finish submitting information to this website. Do not disclose your password to any third party. If you believe your username or password has been compromised for any reason, you should immediately change your password by logging in and accessing the \"**Change Password**\" feature.\r\n\r\nYou agree to notify us immediately of any unauthorized use of your username or password or any other breach of security. We cannot and will not be liable for any loss or damage arising from your failure to protect your username or password.\r\n\r\n_Consent to Collection and Storage of Personal Information_\r\n\r\nAs more fully described in our [Privacy Policy](/privacy-policy), we will collect and store certain personally identifiable information of each School Administrator (such as name, telephone number and email address) for purposes of maintaining and operating this website. The collection, storage and use of such personally identifiable information is governed by our [Privacy Policy](/privacy-policy). By using this website or the services provided hereby, you represent that you have first read our [Privacy Policy](/privacy-policy) and consent to the collection, storage and use of your personally identifiable information in the manner described in our [Privacy Policy](/privacy-policy), which is incorporated by reference herein. While HS Box Scores NYC will take reasonable steps to safeguard and prevent unauthorized access to such personally identifiable information, we cannot be responsible for the acts of those who gain unauthorized access to such personally identifiable information. IN NO EVENT SHALL HS BOX SCORES NYC OR ANY OF ITS ASSOCIATED PERSONS BE LIABLE FOR ANY DAMAGES ARISING OUT OF, OR IN ANY WAY CONNECTED WITH, ANY UNAUTHORIZED ACCESS TO SUCH PERSONALLY IDENTIFIABLE INFORMATION, REGARDLESS OF WHETHER SUCH DAMAGES ARE BASED IN CONTRACT, TORT, STRICT LIABILITY OR ANY OTHER THEORY OF LIABILITY AND ALSO REGARDLESS OF WHETHER HS BOX SCORES NYC HAD ACTUAL OR CONSTRUCTIVE NOTICE THAT SUCH DAMAGES WERE POSSIBLE.\r\n\r\n_Consent to Our Communication With You by Email_\r\n\r\nBy using this website, you grant HS Box Scores NYC permission to contact you at your email address. To stop receiving our emails, send an email to us at [info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com) or follow the opt-out instructions described in such emails. Please note that submitting a request to stop receiving emails from us may result in the suspension or termination of your ability to submit score data and other statistical information through this website.\r\n\r\n_Feedback and Publicity_\r\n\r\nYou agree that any comments you make regarding HS Box Scores NYC via email to us or through other forum (1) will be truthful and accurate and (2) may be used in our promotional materials without any payment or other obligation to you or the team or school which you represent. You also grant HS Box Scores NYC the right to include in any of our promotional materials the fact that you and the team and school you represent are submitting score data and other statistical information through this website. You can deny HS Box Scores NYC the right to include your feedback and/or the fact that the team or school you represent is participating in this website by submitting a written request via email to: [info@hsboxscoresnyc.com](mailto:info@hsboxscoresnyc.com), requesting to be excluded. If you or the team or school you represent are included in any promotional materials before you have submitted an exclusion request, you may, at any point in time, submit such an exclusion request and, upon receipt of such request, HS Box Scores NYC will remove any reference to you or the team or school you represent, as applicable, from all promotional materials within 10 days and make no further reference to you or the team or school you represent in any of our promotional materials.\r\n\r\n_Suspension and Termination of Access_\r\n\r\nYou agree that, in our sole discretion, we may suspend or terminate your username, password or your ability to submit information to this website, and remove and discard any materials that you submit to this website, at any time, for any reason, without notice. You agree that neither HS Box Scores NYC nor any of its Associated Persons will be liable to you or to any third-party for any suspension or termination of your password or username or your use of all or any portion of this website, or any removal of any materials that you have submitted to this website. In the event that we suspend or terminate your access, you will continue to be bound by these Terms of Service as in effect as of the date of such suspension or termination.\r\n\r\n[Privacy Policy](/privacy-policy)")
  end
end