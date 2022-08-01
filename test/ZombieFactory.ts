import {ethers} from 'hardhat';
import {expect} from 'chai';
import {ZombieFactory} from '../typechain-types/ZombieFactory'

describe("ZombieFactory", () => {
	let factory: ZombieFactory;

	it("should deploy", async () => {
		const ZombieFactory = await ethers.getContractFactory("ZombieFactory");
		factory = await ZombieFactory.deploy();

		expect(factory.address).to.not.be.empty;
	});

	it("Should create new Zombie", async () => {
		await factory.createRandomZombie('Foo')
	
		const checkForEvent = () => {
			expect(fired).to.be.true;
		}

		let fired = false;
		factory.once('NewZombie', (e) => {
			fired = true;
			console.log(e);
			checkForEvent();
		});

		setTimeout(checkForEvent, 3000);
	})
})