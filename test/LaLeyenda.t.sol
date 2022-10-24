// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test  .sol";
import "../src/LaLeyenda.sol";
import "openzeppelin-contracts/token/ERC1155/utils/ERC1155Holder.sol";

contract LaLeyendaTest is Test, ERC1155Holder {
    LaLeyenda public laLeyenda;

    function setUp() public {
        laLeyenda = new LaLeyenda();
        assertEq(laLeyenda.owner(), address(this));
    }

    function testAddToken() public {
        laLeyenda.addToken(
            0.3 ether,
            0.25 ether,
            1000,
            1664926338,
            1664940738,
            "",
            ""
        );

        assertEq(laLeyenda.numTokens(), 1);
    }

    function testMint() public {
        testAddToken();

        bytes32[] memory proof;
        uint256 count = 2;
        laLeyenda.mint{value: count * 0.3 ether}(0, count, proof);
        assertEq(laLeyenda.balanceOf(address(this), 0), count);
    }
}
