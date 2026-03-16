// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract NFTMarketplace {
    struct NFT {
        uint256 id;
        address creator;
        string uri;
        uint256 price;
        bool forSale;
    }

    uint256 public nextTokenId;
    mapping(uint256 => NFT) public nfts;
    mapping(address => uint256[]) public userNFTs;
    mapping(address => uint256) public royalties;

    event NFTMinted(uint256 tokenId, address creator, string uri, uint256 price);
    event NFTListed(uint256 tokenId, uint256 price);
    event NFTSold(uint256 tokenId, address buyer, uint256 price);

    function mint(string memory uri, uint256 price) external {
        uint256 tokenId = nextTokenId;
        nfts[tokenId] = NFT({
            id: tokenId,
            creator: msg.sender,
            uri: uri,
            price: price,
            forSale: true
        });
        userNFTs[msg.sender].push(tokenId);
        nextTokenId++;
        emit NFTMinted(tokenId, msg.sender, uri, price);
    }

    function listForSale(uint256 tokenId, uint256 price) external {
        require(nfts[tokenId].creator == msg.sender, "Only creator can list NFT for sale");
        nfts[tokenId].price = price;
        nfts[tokenId].forSale = true;
        emit NFTListed(tokenId, price);
    }

    function buyNFT(uint256 tokenId) external payable {
        require(nfts[tokenId].forSale, "NFT not for sale");
        require(msg.value == nfts[tokenId].price, "Incorrect price");

        address creator = nfts[tokenId].creator;
        uint256 price = nfts[tokenId].price;
        nfts[tokenId].forSale = false;

        uint256 royalty = price / 10;
        royalties[creator] += royalty;
        payable(creator).transfer(price - royalty);
        payable(msg.sender).transfer(royalty);

        emit NFTSold(tokenId, msg.sender, price);
    }
}
