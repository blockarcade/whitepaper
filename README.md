---
title: "BlockArcade - An online decentralized arcade"
date: "July 2019"
author: "Jason Stallings, Joey Bacon"
titlepage: true
titlepage-text-color: "FFFFFF"
titlepage-rule-color: "FFFFFF"
titlepage-color: "141122"
titlepage-rule-height: 2
logo: "block-arcade-logo.png"
logo-width: 240
toc-own-page: true
---

# BlockArcade

<p style="text-align: center;">
  <img src="./block-arcade-logo.png" />
</p>

## 01 Introduction

Our goal with BlockArcade is to emulate the traditional arcade experience, just on the decentralized web! This vision includes arcade tokens using IOST, tickets for prizes using a custom token called TIX, and a prize counter to spend your tickets!

### Background

Jason originally built StackWave for the Bitcoin blockchain back in 2014. For the first time, he had a distributed database that no single person has to maintain, and cost effective micro-transactions under $1. Unfortunately before he could get the project out Bitcoin transaction fees and times sky rocketed. StackWave no longer worked on Bitcoin, so he shelved the project. This is a problem Bitcoin still struggles with today [@wiki:Bitcoin_scalability_problem].
With the introduction of the Lightning Network [@lightning_network] Bitcoin is an option again, but we believe there are better options out there. We’ve come a very long way since Bitcoin was originally released and we want to explore some of the other options out there.

\newpage

## 02 Technology

IOST (Internet of Services token) [@iost] is a newer blockchain that solves many of the problems with the last 3 generations of blockchains. From the start of the project they’ve focused on the user experience, and it shows! Starting with the string account names. 

Want to send me IOST? Send it to “octalmage”, it’s that easy!

Additionally, and probably the most important point:

> We were able to get our app up and running on the IOST blockchain in a weekend, and it is fast!

This says it all. We evaluated Bitcoin Lightning, EOS, and Tron for BlockArcade. After building a couple of prototypes and interacting with the different communities, IOST was the clear winner. With JavaScript as the smart contract language, great documentation, and Docker based local development tools, it was an easy choice for us.
IOST also has very quick and cheap transactions, it’s transactions per second (TPS) is already better than Bitcoin and Ethereum combined, and IOST has already surpassed Ethereum in daily transaction volume [@iost_daily_transactions_2019]. All of this makes IOST a very attractive blockchain.

The IOST team also gets bonus points for hopping on a call with me almost instantly. The second they heard we were working on an IOST app, they wanted to help, and they have! Big thanks to Bing from the IOST team! I haven’t experienced this level of support in any other community, especially not a blockchain community!

\newpage

## 03 Games

### StaveWave 

![](./stackwave.jpg)

StackWave was the first game launched on BlockArcade with more games planned in the future. 

The idea is simple: Tap or click the grid to place the row of blocks. Any blocks that aren’t aligned with the previous row’s blocks are lost and removed. 

The goal is to reach the top row with at least one block!

At row 8 you'll be given the option to take the minor prize (1.2x inserted amount) or go for the jackpot (10% of the contract balance).

Currently StaveWave accepts IOST in increments of 10, 100, or 1000. Pay 100 or more to go for the major jackpot which is 10% of the contract balance. Pay 10 IOST to go for the minor jackpot which is 1%

At the time of writing the IOST put into StackWave is distributed in this fashion:

* 2% goes to an IOST account managed by the developers, batreas. Currently we're auto-voting all of those funds to our IOST node, blockarcade. 
* 78.4% goes to the jackpot. This is kept in the StackWave contract. 
* 19.6% goes to the TIX contract to issue TIX to the user. 

We have no plans to change the 2% developer cut, but we may tweak the amount going to the jackpot or TIX contract in the future. 

StackWave payouts 1 TIX for every IOST spent playing. Players that choose to go for the major jackpot will be rewarded with a 2x payout on TIX.

![StackWave Gameplay](./stackwave_screen.jpg){ width=250px }

Chances of winning the minor and major jackpot depend on a mix of skill and chance. We've added an RNG component to keep the game fair and to keep bots from stealing the jackpot. Chances of winning the minor jackpot is ~80%, and chances of winning the major jackpot is ~2%. These percentages are subject to change in either direction based on the win rates we see.

\newpage

### Quantum Raffle

![](./qr.jpg)

Quantum Raffle is a fun and intricate twist on the classic 50/50 raffle. Quantum Raffle is built on the IOST blockchain, and utilizes Chainlink to pull random numbers from the ANU Quantum Random Numbers Server [@qrnganu]. 

Quantum Raffle contains 5 raffles in total. 3 50/50 raffles (small, medium, and large), a RFL raffle for stakers, and the jackpot raffle for JPT winners.

To get started with Quantum Raffle you will want to purchase one or more tickets for the 3 50/50 raffles.

**Small, Medium, and Large raffles**

--------------------------------------------------------------------------------------
 Raffle   Cost       # of Tickets   RFL Mining Rate    Prize
-------- ---------- -------------- ------------------ -------------------------------
 Small    10 IOST    100            1 RFL per ticket   Win 5000 TIX and 1 JPT token

 Medium   100 IOST   100            10 RFL per ticket  Win 50000 TIX and 10 JPT token

 Large    100 IOST   1000           10 RFL per ticket  Win 500000 TIX and 100 JPT token

--------------------------------------------------------------------------------------

Once all tickets are sold for a raffle a single winner will be chosen and sent the prize. The 3 raffles will reset once all tickets have been sold, and the new round begins.

**RFL raffle**

When you purchase tickets for the small, medium, or large raffle you will receive RFL tokens win or lose. RFL tokens are unique in that they allow players to participate in the RFL raffle passively. 

The RFL raffle will run after each round. A round ends when all 3 50/50 raffles sell out and are drawn.

15 random staked RFL tokens will be rewarded with 18,500 TIX. Each staked token is assigned a number, then 15 random numbers are chosen and matched to the RFL token owners. This means it is possible to win more than once each RFL raffle.

Any RFL tokens staked will be automatically entered into all future RFL raffles until unstaked. Unstaking takes 4 hours.

**Jackpot (JPT) raffle**

Every 10 rounds of the 3 50/50 raffles, we will draw the jackpot raffle and pick 2 winners. 1st prize is 1 million TIX. 2nd prize: 110,000 TIX. Each JPT staked (or owned, JPTs are staked instantly) is 1 entry into the jackpot raffle. All JPT are burned after the jackpot raffle is drawn.

**Diagrams**

![Quantum Raffle IOST Distribution](./graphs/qrpie.png)

Other Breakdown

* 1% Marketing
* 1% Development
* 1% StackWave Jackpot
* 2% TIX Leaderboard

![Quantum Raffle User Flow Chart](./graphs/qrflow.png)

\newpage

## 04 RFL Token

RFL (Quantum Raffle Token) is the stakable token for the RFL raffle.

RFL is an IRC21 [@iost_irc_21] token implemented on the IOST blockchain. 

<!-- Quantum Raffle maintains 10 IOST per issued RFL for buy back at all times. RFL sold to Quantum Raffle will be burnt. -->

RFL total supply is 200,000,000 [@iostabc_token_rfl]. 

![RFL Logo](./rfl.png){ width=250px }

\newpage

## 05 TIX Token

TIX is the digital equivalent to tickets from an arcade. TIX will reward players for playing BlockArcade games, win or loss!

TIX is an IRC20 [@iost_irc_20] token implemented on the IOST blockchain. 

TIX is exchangeable for IOST through the TIX contract at a rate of 10 TIX = 1 IOST. 

TIX total supply is 21,000,000,000 [@iostabc_token_tix]. 

![TIX Logo](./tix.png){ width=250px }

\newpage

## 06 Prize Counter

The prize counter is where you can exchange TIX for prizes, similar to a traditional arcade. This is where you'll be able to trade TIX for IOST, and more. 

Currently our ideas for prizes are:

* IOST!
* Unique digital art using non-fungible tokens on IOST.
* Other IOST IRC20 coins with partner dApps.
* BlockArcade swag (shirts, stickers). 

You will also be able to trade TIX for unique collectible art pieces created by artists either in the crypto community, or in our local community (Austin, Texas). These will be implemented as non-fungible tokens in the IOST blockchain using the IRC721 standard [@iost_irc_721]. 

Our goal is to emulate the arcade as much as possible by providing a wide array of options for exchanging TIX. Any IOST left over in the TIX contract will be used for airdrops and other promotional events. 

## 07 TIX Leaderboard

2% of every TIX issued to players is added to a leaderboard reward pool. 80% of this pool will be distributed to the 10 players that were issued the most TIX during the previous week every Monday at 4:59 UTC. 

Leaderboard payout breakdown (based on # of TIX earned):

  1. 50%
  2. 25%
  3. 10%
  4. 2.5%
  5. 2.5%
  6. 2.5%
  7. 2.5%
  8. 2%
  9. 2%
  10. 1%

20% of the reward pool will roll to the next weeks pool.

\newpage

## 08 Roadmap

---------------------------------------------------------------------------------------------------------------------
 Current                                 Near-term                                 Future
------------------------------------- ---------------------------------------- ----------------------------------------
  **Quantum Raffle**                     **CryptoRun**                            **Money Blocks**               
  Everyone loves a good raffle!          A retro racing game where you get to     A twist on Tetris where we randomly    
  This raffle will be fun and fair       keep the IOST you pick up on the road.   drop blocks filled with IOST and TIX.
  with plenty of ways to win.            Let's see who gets the best lap time!    Clear the blocks to get the cash! 

  Arcade Coin                            IOST Account Creation
---------------------------------------------------------------------------------------------------------------------

Table: This is a small visual to layout a rough timeline for some of the bigger items we're working on. 

In addition to the items listed above, here's a few other roadmap items: 

### IOST Desktop

Cross platform desktop application to allow users to keep track of their IOST accounts and perform common operations like claiming rewards and voting.

![IOST Desktop Mock](./iost-desktop.jpg){width=50%}

Learn more: https://github.com/blockarcade/iost-desktop

\newpage

### IOST WordPress plugin

The plugin will allow users to sign-in to WordPress websites using their IOST account. We also plan to allow WordPress authors to accept IOST as tips for content. Both of these features will work with the IWallet Chrome extention and mobile wallets. 

Many IOST node operators use WordPress to promote their nodes and take donations so we believe this will be valuable to the community.

Learn more: https://github.com/blockarcade/wpiost

### High Quality IOST T-Shirts

We believe this will help get the attention of more developers. Our goal is to be able to offer t-shirts for TIX in at our prize counter in addition to selling them at an online store.

![BlockArcade IOST T-Shirt](./tshirt.jpg){width=50%}

Learn more: https://dapple.store

\newpage

## 09 Disclaimers

You should expect to play games at BlockArcade. You should expect to earn TIX at BlockArcade. You should expect to be able to exchange your TIX for prizes at BlockArcade. Most importantly you should expect to have fun at BlockArcade! You should not expect to make profits at BlockArcade, just like any traditional arcade. 

The TIX token's value is pegged to IOST at 10 TIX to 1 IOST through the TIX contract. 

The value of TIX *WILL NOT* increase. 

WE RESERVE THE RIGHT TO BLOCK PLAYERS AT ANY POINT FOR ANY REASON. When this happens the player will be unable to start new games.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## 10 References