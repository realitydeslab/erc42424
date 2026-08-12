pragma solidity ^0.8.18;

/** @dev IERC42424 Interface for the inheritance of ownership for on-chain agents.
 * Note: This interface extends the IERC173 Ownership standard and IERC165 for interface detection.
 * The `agentId` throughout refers to an agent registered in the ERC-8004 (Trustless Agents)
 * Identity Registry; a compliant inheritance transfer MUST be reflected in the agent's
 * registry entry so that reputation and validation records survive the succession.
 */
interface IERC42424 is IERC173, IERC165 {
  
  /** @dev This event is emitted when the ownership of an on-chain agent with a specific `agentId` is transferred.
   * In the context of on-chain life, this can represent the passing of control over an agent when the original owner is no longer present.
   * The event logs the `agentId`, the `previousOwner` address, and the `newOwner` address.
   */
  event Inheritance(  
    uint256 indexed agentId,  
    address indexed previousOwner,  
    address indexed newOwner  
  );

  /** @notice Designates an heir to an on-chain agent specified by `agentId`.
   * This function allows the current owner to assign a successor, ensuring continuity of the agent's operation in the event of the owner's demise.
   * @param agentId The unique identifier of the on-chain agent.
   * @param heir The address of the heir who will inherit the ownership.
   */
  function designateHeir(
    uint256 agentId,
    address heir
  ) external;

  /** @notice Allows an heir to claim ownership of an on-chain agent specified by `agentId`.
   * This function facilitates the transfer of control to the heir, once the conditions for inheritance are met.
   * @param agentId The unique identifier of the on-chain agent.
   * @param heir The address of the heir claiming the inheritance.
   * @return success A boolean value indicating whether the inheritance claim was successful.
   */
  function claimInheritance(
    uint256 agentId,
    address heir
  ) external returns (bool success);

  /** @notice Enables a community vote to determine the new owner of an on-chain agent specified by `agentId`.
   * This function reflects the decentralized governance aspect of on-chain life, allowing collective decision-making regarding the transfer of ownership.
   * @param agentId The unique identifier of the on-chain agent.
   * @param proposedNewOwner The address of the proposed new owner to be voted on.
   * @return success A boolean value indicating whether the community vote was successful in assigning a new owner.
   */
  function communityVote(
    uint256 agentId,
    address proposedNewOwner
  ) external returns (bool success);
}
